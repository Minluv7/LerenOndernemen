<template>
    <div>
        <h1>Lessen</h1>
        <ul v-for="c in categories" :key="c.id" >
        
          <li>
            <NuxtLink :to="'/cursess/' + c.id">
          
           <img :src="c.image" :alt="c.name">
             <h2>{{c.name}}</h2>
           </NuxtLink>
          </li>
        
        </ul>
    </div>
</template>


<script setup lang="ts">
definePageMeta({
  middleware: 'auth',
})
const {data: categories} = await useFetch(`/api/categories`);


</script>

<style scoped>

</style>