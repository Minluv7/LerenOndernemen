<template>
<div>
  <div class="headDashboard">

    <h1 class=" [text-shadow:_0_2px_3px_rgb(22_40_54_/_50%)] font-inter flex-shrink-0">Education Business</h1>
    <img src="assets/image/logos/LogoDescription.png" alt="logo description">
 <p>Ga vandaag nog uit je comfortzone en ontdek gratis ondernemerschap.</p>
 <p>Leer en groei!</p>
    <div class="">
      <a class="rounded-lg text-white border-2 border-solid w-80 border-[#013A63] bg-[#7AA5B8] flex px-4 py-2 justify-center items-center gap-4" href="/register">Registreer</a>
      <a class="rounded-md bg-blue-100 border border-blue-400 text-blue-400 shadow-md flex w-80 px-4 py-2 justify-center items-center gap-4" href="/login">Login</a>
      
    </div>
    
    <ul>
      <li>
      
          <div v-for=" d in dashboard" :key="d.id">
            <h2>{{d.title}}</h2>
            <p>{{d.description}}</p>
            <img :src="d.image" :alt="d.title">
            
          </div>
      
      </li>
    </ul>
     <a class="rounded-lg text-white border-2 border-solid border-[#013A63] bg-[#7AA5B8] flex w-[324px] px-4 py-2 justify-center items-center gap-4" href="/register">Registreer</a>
    </div>
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
.headDashboard{
  max-width: 90%;
  margin: 0 auto;
}
</style>
