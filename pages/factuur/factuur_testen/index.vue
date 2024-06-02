<template>
  <div v-if="invoiceTest">
        <button class="w-20 border-none mb-8" @click="goBack"> Terug</button>
    <div v-if="currentQuestionIndex < invoiceTest.length">
      <div>
      <div class="flex justify-between">
 <h2>{{ currentQuestion.question }}</h2>
           <p>{{ currentQuestionIndex + 1 }} / {{ invoiceTest.length }}</p>
      </div>
       
        <div v-for="answer in currentQuestion.answers" :key="answer.id">
          <button @click="selectAnswer(answer)">{{ answer.answer }}</button>
        </div>
      </div>
    </div>
     <div v-else>
      <h2>Quiz voltooid!</h2>
      <p>Je hebt {{ correctAnswers }} van de {{ invoiceTest.length }} vragen correct beantwoord.</p>
      <div v-for="(question, index) in invoiceTest" :key="index">
        <p>Vraag {{ index + 1 }}: {{ question.question }}</p>
        <p>Je antwoord: <span :style="{ color: question.selectedAnswer.correct ? 'green' : 'red' }">{{ question.selectedAnswer.answer }}</span></p>
      </div>
      <button @click="resetQuiz">Opnieuw beginnen</button>
    </div>
  </div>
</template>


<script setup lang="ts">
definePageMeta({
  middleware: 'auth',
})

const invoiceTest = ref<InvoiceTest[]>([]);
const currentQuestionIndex = ref<number>(0);
const correctAnswers = ref<number>(0);

const fetchInvoiceTest = async () => {
    try {
        const response = await fetch('/invoiceTest.json')
        const dataInvoiceTest = await response.json()
        //@ts-ignore
        invoiceTest.value = dataInvoiceTest.invoiceTest as InvoiceTest
    } catch (error) {
        console.error('Failed to fetch invoice:', error)
    }
}

onMounted(fetchInvoiceTest)

const currentQuestion = computed(() => {
  return invoiceTest.value ? invoiceTest.value[currentQuestionIndex.value] : null
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
  invoiceTest.value.forEach(question => {
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