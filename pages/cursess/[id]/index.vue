<!-- pages/cursess/[id].vue -->
<template>
  <div v-if="category">
    <h1>{{ category.name }}</h1>
    <ul>
      <li v-for="sub in category.subCategories" :key="sub.id">
        <h3>{{ sub.title }}</h3>
        <img :src="sub.image" :alt="sub.title">
      </li>
    </ul>
  </div>
</template>

<script setup lang="ts">
import { useFetch } from '#app';

const route = useRoute();
const { data: category } = await useFetch(`/api/category/${route.params.id}`);
</script>

<style scoped>

</style>
