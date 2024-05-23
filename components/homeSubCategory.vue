<template>
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
</template>

<script setup lang="ts">

import { useFetch } from '#app';
// Fetch user data
const { data } = useAuth();

// Fetch subcategories
const { data: categories } = await useFetch('/api/firstSubCategories');

</script>

<style scoped>
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

</style>