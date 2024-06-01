<template>
  <div class="mb-20">
   
    <ul class="flex gap-4 flex-col pb-6">
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
     <button @click="downloadAllAsPDF">Download als PDF</button>
  </div>
</template>

<script setup>

let html2pdf;

onMounted(async () => {
  if (process.client) {
    // Dynamisch importeren van html2pdf.js op de client-side
    html2pdf = await import('html2pdf.js');
  }
});

const { data: businessPlan } = await useFetch('/api/businessPlan');

const downloadAllAsPDF = async () => {
// Fetch all business plans
  const allBusinessPlans = await Promise.all(
    businessPlan.value.map(async (business) => {
      const response = await fetch(`/api/businessPlan/${business.id}`);
      //parse het antwoord als JSON en geef het terug
      return response.json();
    })
  );
// Maak een div element aan voor de PDF content
  const element = document.createElement('div');
  allBusinessPlans.forEach(plan => {
    // Maak een div element aan voor elk business plan
    const planDiv = document.createElement('div');
    // vul de div met de HTML content van het business plan
    planDiv.innerHTML = `

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
    `;
    element.appendChild(planDiv);
  });

  const opt = {
    margin:       0.5,
    filename:     'Business_Plans.pdf',
    image:        { type: 'jpeg', quality: 0.98 },
    html2canvas:  { scale: 2 },
    jsPDF:        { unit: 'in', format: 'letter', orientation: 'portrait' }
  };
  html2pdf().from(element).set(opt).save();
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
