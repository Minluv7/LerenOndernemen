<template>
    <div>
        <ul class="grid-container pt-8 pb-20">
            <li v-for="c in categories" :key="c.id" class="grid-item" >
            <NuxtLink :to="`/curses/${c.id}`" class="flex flex-col gap-4 items-center">
                <h2>{{c.name}}</h2>
                <img  :src="c.image" :alt="c.name">
            </NuxtLink>
            </li>
        </ul>
    </div>
</template>

<script setup lang="ts">

const {data: categories} = await useFetch(`/api/categories`);

</script>

<style scoped>

.grid-container {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    grid-template-rows: repeat(2, auto);
    gap: 2rem;
    align-items: baseline;
    justify-items: center;
}

.grid-item {
  list-style: none; 
  padding: 0;
}
</style>