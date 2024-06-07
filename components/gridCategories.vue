<template>
    <ul class="grid-container pt-8 pb-20">
        <li v-for="c in categories" :key="c.id" class="grid-item rounded-3xl bg-[#61A5C2] flex justify-center" >
            <NuxtLink :to="`/curses/${c.id}`" class="flex flex-col p-4 gap-4 items-center justify-between">
                <div class="image-container">
                    <img :src="c.image" :alt="c.name" class="category-image">
                </div>
                <p class="font-bold">{{c.name}}</p>
            </NuxtLink>
        </li>
    </ul>
</template>

<script setup lang="ts">
const { data: categories } = await useFetch(`/api/categories`);
</script>

<style scoped>
.grid-container {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    grid-template-rows: auto;
    gap: 0.625rem;
    margin-bottom: 2rem;
    justify-content: center;
}

.grid-item {
    list-style: none; 
    padding: 0;
}

.image-container {
    width: 100%;
    height: 150px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.category-image {
    max-width: 100%;
    max-height: 100%;
    object-fit: contain;
}
</style>
