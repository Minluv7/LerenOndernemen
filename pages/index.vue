<template>
  <div>
    <NuxtLayout name="index">
    <h1>Dashboard pagina</h1>
    <p>Op deze website vind je alle informatie die je nodig hebt om te leren ondernemen.</p>
    <div class="">
      <a class="rounded-lg text-white border-2 border-solid border-[#013A63] bg-[#7AA5B8] flex w-[324px] px-4 py-2 justify-center items-center gap-4" href="*">Registreer</a>
    <a class="rounded-md bg-blue-100 border border-blue-400 text-blue-400 shadow-md flex w-[324px] px-4 py-2 justify-center items-center gap-4" href="/login">Login</a>

    </div>
   
    </NuxtLayout>
  </div>
</template>

<script setup>
definePageMeta({
  layout: false,
})
</script>

<style scoped>
/* Voeg hier stijlen toe die specifiek zijn voor deze pagina */
</style>
