<template>
<div class="headDashboard">
    <h1 class="mt-5 text-center font-inter flex-shrink-0">Education Business</h1>
  <div class="flex flex-wrap justify-center">
    <div class="flex justify-center mt-8">
      <img class="w-90" src="assets/image/logos/LogoDescription.png" alt="logo description">
    </div>
    <div class="flex flex-col justify-center mb-20">
      <p class="pb-4">Ga vandaag nog uit je comfortzone en ontdek gratis ondernemerschap.</p>
      <p class="pb-4">Leer en groei!</p>
      <div class="self-center">
        <CustomButton class="mb-4" label="Registreer" link="/register"/>
        <CustomButton label="Login" link="/login" variant="secondary" />
      </div>
    </div>
  </div>
    <ul>
      <li>
          <div class="flex flex-wrap gap-4 justify-center mb-16 " v-for=" d in dashboard" :key="d.id">
            <div class="w-2/4">
              <h2>{{d.title}}</h2>
              <p>{{d.description}}</p>
            </div>
            
            <img class="w-80" :src="d.image" :alt="d.title">
            
          </div>
      </li>
    </ul>
    <div class="flex items-center flex-col justify-center mb-20">
      <h2 class="p-8">Leer ondernemen met Education Business</h2>
      <CustomButton  label="Registreer" link="/register"/>
    </div>
  </div>
</template>

<script setup lang="ts">
const {data: dashboard} = await useFetch(`/api/dashboard`);

</script>

<style scoped>

</style>