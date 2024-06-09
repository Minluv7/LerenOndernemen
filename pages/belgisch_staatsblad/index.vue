<template>
    <div class="space pb-32">
      <lessonsPages />
      <NuxtLink class="flex justify-center pt-8" :to="'/belgisch_staatsblad/belgisch_staatsblad_test'">
        <button class="max-w-fit border-none">Belgisch staatsblad kennis testen</button>
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