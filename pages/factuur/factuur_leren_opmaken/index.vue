<template>
    <div v-if="invoice">
       
        <h1>{{ invoice.title }}</h1>
        <p>{{ invoice.description }}</p>
        <p>Geef de juiste antwoord om de factuur te vervolledigen.</p>
         <ul v-for="item in invoice.questions" :key="item.id">
            <li>{{item.question}}</li>
        </ul>
        <ul v-for="item in invoice.answers" :key="item.id">
            <li>{{item.answer}}</li>
        </ul>
    </div>
</template>

<script setup lang="ts">

const invoice = ref<Invoice | null>(null)
const fetchInvoice = async () => {
try {
  const response = await fetch('/invoice.json')
  const dataInvoice = await response.json()
   //@ts-ignore
  invoice.value = dataInvoice.invoice as Invoice[];

} catch (error) {
    console.error('Failed to fetch invoice:', error)
    }
}
onMounted(fetchInvoice)
</script>

<style scoped>

</style>