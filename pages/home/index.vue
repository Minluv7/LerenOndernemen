<template>
  <div class="space">
    <div class="flex items-center pt-6 flex-col">
      <h1 class="text-center">Welkom {{ data.user.userName }}</h1>
      <img src="/assets/image/homePage/home.png" alt="home_page_image">
    </div>
    
    <div class="pt-16 pb-16">
      <h2>Onze verschillende lessen</h2>
      <div >
         <ul class="grid-container" >
          <li v-for="category in categories" :key="category.id" class="grid-item">
            <div v-if="category.subCategories.length > 0">
               <NuxtLink :to="`/${category.subCategories[0].slug}`" class="flex flex-col gap-4 items-center">
              <img class="w-60" :src="category.subCategories[0].image" :alt="category.subCategories[0].title">
              <h3 class="text-center">{{ category.subCategories[0].title }}</h3>
              </NuxtLink>
            </div>
          </li>
        </ul>
      </div>
    </div>
    <div class="pb-32">
      <h2 class="pb-8">Motivatie van de dag</h2>
      <div>
        <ul>
          <li class="blur-border w-full">
            {{ dailyMotivation.quote }}
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, computed } from 'vue';
import { useFetch } from '#app';

definePageMeta({
  middleware: 'auth',
});

// Define types
interface Motivation {
  id: number;
  quote: string;
}

// Fetch user data
const { data } = useAuth();

// Fetch subcategories
const { data: categories } = await useFetch('/api/firstSubCategories');

// Fetch motivations data
const motivations = ref<Motivation[]>([]);
const fetchMotivations = async () => {
  try {
    const response = await fetch('/motivations.json');
    const dataMotivation = await response.json();
    //@ts-ignore
    motivations.value = dataMotivation.motivations as Motivation[];
  } catch (error) {
    console.error('Failed to fetch motivations:', error);
  }
};

// Helper function to calculate the day of the year
const getDayOfYear = (date: Date): number => {
  const start = new Date(date.getFullYear(), 0, 0);
  const diff = date.getTime() - start.getTime();
  const oneDay = 1000 * 60 * 60 * 24;
  const day = Math.floor(diff / oneDay);
  return day;
};

// Computed property to get the daily motivation
const dailyMotivation = computed(() => {
  if (motivations.value.length === 0) return { id: 0, quote: '' };
  const dayOfYear = getDayOfYear(new Date());
  const index = dayOfYear % motivations.value.length;
  return motivations.value[index];
});

onMounted(async () => {
  await fetchMotivations();
});
</script>

<style scoped>
.space {
  max-width: 90%;
  margin: 0 auto;
}
.grid-container {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    grid-template-rows: repeat(2, auto);
    gap: 3rem;
    align-items: baseline;
    justify-items: center;
}

.grid-item {
  list-style: none; 
  padding: 0;
}

.blur-border {
  display: inline-block; 
  padding: 1rem; 
  background: #e7eff8; 
  border: .125rem solid transparent; 
  border-radius: 1rem;
  box-shadow: 0 0 .625rem .3125rem rgba(1, 58, 99, 0.5);
}


</style>
