<template>
  <QuizComponent fetchUrl="/database/belgianJournal.json" quizKey="belgianJournal" />
</template>

<script setup lang="ts">
import quizComponent from '@/components/quizComponent.vue';
definePageMeta({
  middleware: 'auth',
});
</script>

<style scoped>
</style>
