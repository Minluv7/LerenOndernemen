<template>
  <div v-if="belgianJournal">
        <button class="w-20 border-none mb-8" @click="goBack"> Terug</button>
    <div v-if="currentQuestionIndex < belgianJournal.length">
      <div>
      <div>
        <p>{{ currentQuestionIndex + 1 }} / {{ belgianJournal.length }}</p>
        <h2>{{ currentQuestion.question }}</h2>
      </div>
        <div  class="flex gap-4 mt-4 flex-wrap">
          <button v-for="answer in currentQuestion.answers" :key="answer.id" class="underline border-none max-w-max " @click="selectAnswer(answer)">{{ answer.answer }}</button>
        </div>
      </div>
    </div>
    <div v-else class="mb-40">
      <h2>Quiz voltooid!</h2>
      <h3 class="font-bold">Je hebt {{ correctAnswers }} van de {{ belgianJournal.length }} vragen correct beantwoord.</h3>
      <div v-for="(question, index) in belgianJournal" :key="index">
        <p class="font-bold pt-4">Vraag {{ index + 1 }}: {{ question.question }}</p>
        <p>Je antwoord: <span :style="{ color: question.selectedAnswer.correct ? 'green' : 'red' }">{{ question.selectedAnswer.answer }}</span></p>
      </div>
      <button class="mt-4 max-w-fit" @click="resetQuiz">Opnieuw beginnen</button>
    </div>
  </div>
</template>


<script setup lang="ts">
definePageMeta({
  middleware: 'auth',
})

const belgianJournal = ref<BelgianJournal[]>([]);
const currentQuestionIndex = ref<number>(0);
const correctAnswers = ref<number>(0);

const fetchBelgianJournal = async () => {
    try {
        const response = await fetch('/database/belgianJournal.json')
        const dataBelgianJournal = await response.json()
        //@ts-ignore
        belgianJournal.value = dataBelgianJournal.belgianJournal as belgianJournal
    } catch (error) {
        console.error('Failed to fetch Belgian offical journal:', error)
    }
}

onMounted(() => {
    fetchBelgianJournal()
})

const currentQuestion = computed(() => {
  return belgianJournal.value ? belgianJournal.value[currentQuestionIndex.value] : null
});

const selectAnswer = (answer: AnswerTest) => {
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
  belgianJournal.value.forEach(question => {
    //@ts-expect-error
    question.selectedAnswer = null;
  });
};

const router = useRouter()

const goBack = () => {
  router.back()
}

</script>

<style scoped>

</style>