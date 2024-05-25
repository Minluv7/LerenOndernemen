<template>
<div v-if="invoice" class="space">
    <button class="w-20 border-none mb-8" @click="goBack"> Terug</button>
    <div class="flex flex-col lg:flex-row gap-4">
      <div class="mb-8 w-full lg:w-1/2">
        <div class="mb-4">
          <h2>{{ invoice.title }}</h2>
          <p>{{ invoice.description }}</p>
        </div>
        <div class="flex justify-center items-center">
          <img :src="currentImage" alt="Factuur afbeelding">
        </div>
      </div>

      <div class="mt-4 w-full lg:w-1/2" v-if="currentQuestionIndex < invoice.questions.length">
        <p>Geef de juiste antwoord om de factuur te vervolledigen.</p>
        <h2 class="mb-4">{{ currentQuestion.question }}</h2>
        <p v-if="errorMessage" class="error">{{ errorMessage }}</p>
        <ul class="flex flex-wrap gap-1 justify-start">
          <li v-for="answer in invoice.answers" :key="answer.id">
            <button class="max-w-fit" @click="checkAnswer(answer.id)">{{ answer.answer }}</button>
          </li>
        </ul>
      </div>
      <div v-else>
        <p>Je hebt alle vragen beantwoord!</p>
        <ConfettiExplosion />
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import ConfettiExplosion from 'vue-confetti-explosion'

definePageMeta({
  middleware: 'auth',
})

const router = useRouter()

const invoice = ref<Invoice | null>(null)
const currentQuestionIndex = ref(0)
const errorMessage = ref<string | null>(null)

const fetchInvoice = async () => {
  try {
    const response = await fetch('/invoice.json')
    const dataInvoice = await response.json()
    //@ts-ignore
    invoice.value = dataInvoice.invoice as Invoice
     
  } catch (error) {
    console.error('Failed to fetch invoice:', error)
  }
}

const checkAnswer = (answerId: number) => {
  if (invoice.value && invoice.value.questions[currentQuestionIndex.value].answer_id === answerId) {
    currentQuestionIndex.value++
     errorMessage.value = null 
  } else {
    errorMessage.value = 'Fout antwoord. Probeer het opnieuw.'
  }
}

onMounted(fetchInvoice)

const currentQuestion = computed(() => {
  return invoice.value ? invoice.value.questions[currentQuestionIndex.value] : null
})
const goBack = () => {
    router.back()
}

const currentImage = computed(() => {
  return invoice.value && currentQuestionIndex.value > 0
    ? invoice.value.questions[currentQuestionIndex.value - 1].image
    : '/img/invoice/0.png'
})

</script>


<style scoped>
.space {
  max-width: 90%;
  margin: 0 auto;
}
</style>