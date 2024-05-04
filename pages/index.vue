<template>
  <div >
 
    <div class="">
      <a class="rounded-lg text-white border-2 border-solid border-[#013A63] bg-[#7AA5B8] flex w-[324px] px-4 py-2 justify-center items-center gap-4" href="/register">Registreer</a>
      <a class="rounded-md bg-blue-100 border border-blue-400 text-blue-400 shadow-md flex w-[324px] px-4 py-2 justify-center items-center gap-4" href="/login">Login</a>
      
    </div>
     <a class="rounded-lg text-white border-2 border-solid border-[#013A63] bg-[#7AA5B8] flex w-[324px] px-4 py-2 justify-center items-center gap-4" href="/register">Registreer</a>
    <ul>
      <li>
       
          <div v-for=" d in dashboard" :key="d.id">
            <h2>{{d.title}}</h2>
            <p>{{d.description}}</p>
            <img :src="d.image" :alt="d.title">
            
          </div>
       
      </li>
    </ul>
    <Footer />
  </div>
</template>

<script setup lang="ts">
import Footer from "~/components/footer.vue";

// fetch the products
const {data: dashboard} = await useFetch(`/api/dashboard`);

definePageMeta({
  layout: false,
})
</script>

<style scoped>
/* Voeg hier stijlen toe die specifiek zijn voor deze pagina */
</style>
