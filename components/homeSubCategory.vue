<template>
    <div class="pt-16 pb-10">
      <h2>Onze verschillende lessen</h2>
      <div>
        <ul class="grid-container pt-8 pb-20">
          <li v-for="category in categories" :key="category.id" class="grid-item rounded-3xl bg-[#BADBE7]">
            <div  v-if="category.subCategories.length > 0">
              <NuxtLink :to="`/${category.subCategories[0].slug}`" class="flex flex-col p-4 gap-4 items-center justify-between" @click="markAsViewed(category.subCategories[0].id)">
                <img class="w-[8rem] h-[10rem] object-cover sub-image" :src="category.subCategories[0].image" :alt="category.subCategories[0].title">
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

const markAsViewed = async (subCategoryId: any) => {
  await $fetch('/api/markViewed', {
    method: 'POST',
    body: { subCategoryId }
  })

}

</script>

<style scoped>

.grid-container {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-template-rows: repeat(2, auto);
  gap: 2rem;
  align-items: stretch;
}

.grid-item {
  list-style: none; 
  padding: 0;
}

.sub-image {
  max-width: 100%;
  max-height: 100%;
  object-fit: contain;
}

</style>