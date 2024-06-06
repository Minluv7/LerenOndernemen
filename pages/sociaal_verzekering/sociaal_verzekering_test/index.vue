<template>
  <div v-if="socialInsurance">
        <button class="w-20 border-none mb-8" @click="goBack"> Terug</button>
    <div v-if="currentQuestionIndex < socialInsurance.length">
      <div>
      <div>
        <p>{{ currentQuestionIndex + 1 }} / {{ socialInsurance.length }}</p>
        <h2>{{ currentQuestion.question }}</h2>
      </div>
        <div  class="flex gap-4 mt-4 flex-wrap">
          <button v-for="answer in currentQuestion.answers" :key="answer.id" class="underline border-none max-w-max " @click="selectAnswer(answer)">{{ answer.answer }}</button>
        </div>
      </div>
    </div>
    <div v-else class="mb-40">
      <h2>Quiz voltooid!</h2>
      <h3 class="font-bold">Je hebt {{ correctAnswers }} van de {{ socialInsurance.length }} vragen correct beantwoord.</h3>
      <div v-for="(question, index) in socialInsurance" :key="index">
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

const socialInsurance = ref<SocialInsurance[]>([]);
const currentQuestionIndex = ref<number>(0);
const correctAnswers = ref<number>(0);

const fetchSocialInsurance = async () => {
    try {
        const response = await fetch('/database/social-insurance.json')
        const dataSocialInsurance = await response.json()
        //@ts-ignore
        socialInsurance.value = dataSocialInsurance.socialInsurance as socialInsurance
    } catch (error) {
        console.error('Failed to fetch social insurance:', error)
    }
}

onMounted(fetchSocialInsurance)

const currentQuestion = computed(() => {
  return socialInsurance.value ? socialInsurance.value[currentQuestionIndex.value] : null
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
  socialInsurance.value.forEach(question => {
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