<template>
  <div>
    <ul class="flex gap-4 flex-col">
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
   
     <button @click="downloadAllAsPDF">
      Download businessplan als PDF
    </button>
  </div>
</template>

<script setup>

let htmlToPdf

onMounted(async () => {
  htmlToPdf = (await import('html2pdf.js')).default
})

const { data: businessPlan } = await useFetch('/api/businessPlan');


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
          <p>${question.question}</p>
          ${question.businessPlanValue.map(value => `
            <p>${value.value}</p>
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

  // Converteer de gecombineerde HTML-inhoud naar een PDF-bestand
  const pdf = await htmlToPdf(combinedHTML);

  // Download het PDF-bestand
  pdf.download('Business_Plans.pdf');
};


definePageMeta({
  middleware: 'auth',
});

</script>

<style>
.business-item:hover li p {
  color: white;
}
</style>
