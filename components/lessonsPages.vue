<template>
    <div>
        <div>
            <div v-for="sub in subCategories" :key="sub.id">
            <h1>{{ sub.title }}</h1>
            <img :src="sub.avatar" alt="avatar" />
            <p>{{ sub.description }}</p>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">

import { useFetch } from '#app';

const route = useRoute();
console.log(route);
const slug = route.path.split('/').pop(); 
const { data: subCategories } = await useFetch(`/api/subCategory/${slug}`);

</script>

<style scoped>

</style>