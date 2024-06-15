<template>
  <QuizComponent fetchUrl="/database/social-insurance.json" quizKey="socialInsurance" />
</template>

<script setup lang="ts">
  import quizComponent from '@/components/quizComponent.vue';
definePageMeta({
  middleware: 'auth',
});
</script>

<style scoped>
</style>
