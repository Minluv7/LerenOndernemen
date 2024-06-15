<template>
  <QuizComponent fetchUrl="/database/invoiceTest.json" quizKey="invoiceTest" />
</template>

<script setup lang="ts">
import quizComponent from '@/components/quizComponent.vue';
definePageMeta({
  middleware: 'auth',
});
</script>

<style scoped>
</style>
