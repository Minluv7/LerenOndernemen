<template>
  <ul class="flex gap-4 flex-col pb-4">
    <NuxtLink
      v-for="business in businessPlan"
      :key="business.id"
      :to="`/business_plan/business_plan_list/${business.id}`"
      class="rounded-md border border-[#61A5C2] p-4 h-20 content-center hover:bg-[#61A5C2] hover:text-white transition duration-300 business-item">
      <li class="flex gap-4">
        <p>{{ business.id }}.</p>
        <p>{{ business.title }}</p>
      </li>
    </NuxtLink>
  </ul>
    <div class=" flex justify-center">
      <button class="max-w-fit border-none" @click="downloadAllAsPDF">
        Download businessplan als PDF
      </button>
    </div>
</template>

<script setup>

import AES from 'crypto-js/aes'; 
import Utf8 from 'crypto-js/enc-utf8';

let htmlToPdf

onMounted(async () => {
  htmlToPdf = (await import('html2pdf.js')).default
})

const { data: businessPlan } = await useFetch('/api/businessPlan');

// Encryption key, replace with a secure key
const encryptionKey = process.env.SECRET_KEY || 'SECRET_KEY';

// Function to decrypt value
const decryptValue = (encryptedValue) => {
  const bytes = AES.decrypt(encryptedValue, encryptionKey);
  return bytes.toString(Utf8);
};

const downloadAllAsPDF = async () => {
  // Array om de HTML-inhoud van elk bedrijfsplan op te slaan
  const businessPlanHTML = [];

  // Loop door elk bedrijfsplan en haal de HTML-inhoud op
  for (const business of businessPlan.value) {
    const response = await fetch(`/api/businessPlan/${business.id}`);
    const plan = await response.json();

    // Maak een div element aan voor het bedrijfsplan
    const planDiv = document.createElement('div');
    planDiv.innerHTML = `
    <div style="padding: 1rem;">
      <h2>${plan.title}</h2>
      ${plan.businessPlanQuetion.map(question => `
        <div>
          <p class="font-bold">${question.question}</p>
          ${question.businessPlanValue.map(value => `
            <p>${decryptValue(value.value)}</p>
          `).join('')}
          ${!question.businessPlanValue.length ? `<p>${question.answerValue}</p>` : ''}
        </div>
  
      `).join('')}
        </div>
    `;

    // Voeg de HTML-inhoud van het bedrijfsplan toe aan de array
    businessPlanHTML.push(planDiv.innerHTML);
  }

  // Combineer alle HTML-inhoud met een scheidingsteken
  const combinedHTML = businessPlanHTML.join('<hr>');

  const worker = htmlToPdf().from(combinedHTML);

worker.save('Business_Plan.pdf')

  .then(() => console.log('PDF generation finished'))
  .catch((error) => console.error('Error during PDF generation', error))

};


</script>

<style scoped>
.business-item:hover li p {
  color: white;
}
</style>