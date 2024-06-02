<template>
    <div class="space pb-32"> 
  <lessonsPages />
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