<template>
  <div v-if="quizData">
    <button class="w-20 border-none mb-8" @click="goBack"> Terug</button>
    <div v-if="currentQuestionIndex < quizData.length">
      <div>
        <div>
          <p>{{ currentQuestionIndex + 1 }} / {{ quizData.length }}</p>
          <h2>{{ currentQuestion.question }}</h2>
        </div>
        <div class="flex gap-4 mt-4 flex-wrap">
          <button v-for="answer in currentQuestion.answers" :key="answer.id" class="underline border-none max-w-max " @click="selectAnswer(answer)">{{ answer.answer }}</button>
        </div>
      </div>
    </div>
    <div v-else class="mb-40">
      <h2>Quiz voltooid!</h2>
      <h3 class="font-bold">Je hebt {{ correctAnswers }} van de {{ quizData.length }} vragen correct beantwoord.</h3>
      <div v-for="(question, index) in quizData" :key="index">
        <p class="font-bold pt-4">Vraag {{ index + 1 }}: {{ question.question }}</p>
        <p>Je antwoord: <span :style="{ color: question.selectedAnswer.correct ? 'green' : 'red' }">{{ question.selectedAnswer.answer }}</span></p>
      </div>
      <button class="mt-4 max-w-fit" @click="resetQuiz">Opnieuw beginnen</button>
    </div>
  </div>
</template>

<script setup lang="ts">

import { ref, computed, onMounted } from 'vue';
import { useRouter } from 'vue-router';

// Defineer de props die de QuizComponent verwacht
const props = defineProps({
  // De URL van waar de JSON-gegevens opgehaald moeten worden
  fetchUrl: {
    type: String,
    required: true,
  },
  // De sleutel van de quiz in de JSON-gegevens
  quizKey: {
    type: String,
    required: true,
  },
});

// ref slaat quizData op als een reactive variabele
const quizData = ref<any[]>([]);
// ref slaat de huidige vraagindex op
const currentQuestionIndex = ref<number>(0);
// ref slaat het aantal correct beantwoorde vragen op
const correctAnswers = ref<number>(0);

const fetchQuizData = async () => {
  try {
    // Haal de JSON-gegevens op van de fetchUrl
    const response = await fetch(props.fetchUrl);
    const data = await response.json();
    //@ts-ignore
    // Sla de quizgegevens op in quizData
    quizData.value = data[props.quizKey] as any[];
  } catch (error) {
    console.error('Failed to fetch quiz data:', error);
  }
};
// lifecycle hook die fetchQuizData aanroept wanneer de component aangemaakt wordt
onMounted(fetchQuizData);

const currentQuestion = computed(() => {
  return quizData.value ? quizData.value[currentQuestionIndex.value] : null;
});

const selectAnswer = (answer: any) => {
  if (currentQuestion.value) {
    currentQuestion.value.selectedAnswer = answer;
  }
  if (answer.correct) {
    correctAnswers.value++;
  }
  currentQuestionIndex.value++;
};

const resetQuiz = () => {
  currentQuestionIndex.value = 0;
  correctAnswers.value = 0;
  quizData.value.forEach(question => {
    question.selectedAnswer = null;
  });
};

const router = useRouter();

const goBack = () => {
  router.back();
};
</script>

<script lang="ts">
    export default {}
</script>

<style scoped>
</style>
