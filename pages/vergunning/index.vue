<template>
    <div class="space">
      <will-come />
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