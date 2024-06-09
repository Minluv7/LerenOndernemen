<template>
  <div class="space">
    <div v-if="user" class="flex items-center pt-6 flex-col">
      <h1 class="text-center">Welkom {{ user.userName }}</h1>
      <p class="text-center pt-4">Leer vandaag meer over ondernemerschap.</p>
      <img src="/assets/image/homePage/home.png" alt="home_page_image">
    </div>
    <homeSubCategory/>
    <dailyMotivation/>
  </div>
</template>

<script setup lang="ts">

const { data } = useAuth();

const {data: user} = useFetch('/api/userData');

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
