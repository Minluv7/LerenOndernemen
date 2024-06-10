<template>
    <div class="space pb-32"> 
      <lessonsPages />
      <NuxtLink class="flex justify-center pt-8" :to="'/sociale_verzekering/sociale_verzekering_test'">
        <button class="max-w-fit border-none">Sociale verzekering kennis testen</button>
      </NuxtLink>
    </div>
</template>

<script setup lang="ts">
definePageMeta({
  middleware: 'auth',
})
</script>

<style scoped>
.space{
  max-width: 90%;
  margin: 0 auto;
}
</style>