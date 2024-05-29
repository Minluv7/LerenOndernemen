<template>
    <div class="space">
      <h1 class="text-center pt-8">{{ category.name }}</h1>
    <div class="flex justify-center">
    <ul class="grid-container pt-8 pb-20">
      <li v-for="sub in category.subCategories" :key="sub.id" class="grid-item rounded-3xl bg-[#BADBE7]">
        <NuxtLink :to="`/${sub.slug}`" class="flex flex-col p-4 gap-4 items-center justify-between" @click="markAsViewed(sub.id)">
          <img :src="sub.image" :alt="sub.title" />
          <h3>{{ sub.title }}</h3>
          <div v-if="sub.viewed" class="viewed-badge">✔️</div>
        </NuxtLink>
      </li>
    </ul>
    </div>
    </div>
</template>

<script setup lang="ts">
import { useFetch } from '#app';

const route = useRoute();
const { data: category } = await useFetch(`/api/category/${route.params.id}`);


const markAsViewed = async (subCategoryId: any) => {
  await $fetch('/api/markViewed', {
    method: 'POST',
    body: { subCategoryId }
  })

}

</script>

<style scoped>

.space {
  max-width: 90%;
  margin: 0 auto;
}

.vh {
  height: 45vh;
}

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

</style>