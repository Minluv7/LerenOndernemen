<template>
    <div class="space">
        <h1 class="text-center pt-8">Lessen</h1>
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
    </div>
</template>

<script setup lang="ts">
definePageMeta({
  middleware: 'auth',
})
const {data: categories} = await useFetch(`/api/categories`);

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
    gap: 2rem;
    align-items: baseline;
    justify-items: center;
}

.grid-item {
  list-style: none; 
  padding: 0;
}

</style>