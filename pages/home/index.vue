<template>
  <div class="space">
    <h1 class="text-center">Welkom {{ data.user.userName }}</h1>
    <img src="/assets/image/homePage/home.png" alt="home_page_image">
    <div v-if="subCategories">
      <h2>Onze verschillende lessen</h2>
      <ul>
        <li v-for="sub in subCategories" :key="sub.id">
          <h3>{{ sub.name }}</h3>
          <img :src="sub.image" :alt="sub.title">
        </li>
      </ul>
    </div>
    <div v-if="motivations.length">
      <h2>Motivatie van de dag</h2>
      <div>
        <ul>
          <li>
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
const { data: subCategories } = await useFetch('/api/firstSubCategories');

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
</style>
