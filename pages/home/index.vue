<template>
  <div class="space">
    <div class="flex items-center pt-6 flex-col">
      <h1 class="text-center">Welkom {{ data.user.userName }}</h1>
      <p>Leer vandaag hoe je moet beginnen met ondernemen.</p>
      <img src="/assets/image/homePage/home.png" alt="home_page_image">
    </div>
    <homeSubCategory/>
    <dailyMotivation/>
  </div>
</template>

<script setup lang="ts">

const { data } = useAuth();

definePageMeta({
  middleware: 'auth',
});

</script>

<style scoped>
.space {
  max-width: 90%;
  margin: 0 auto;
}
</style>
