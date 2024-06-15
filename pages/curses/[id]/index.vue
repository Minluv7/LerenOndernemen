<!-- pages/cursess/[id].vue -->
<template>
   <all-lessons/>
</template>

<script setup lang="ts">
definePageMeta({
  middleware: 'auth',
});
</script>

<style scoped>
</style>
