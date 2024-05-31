<template>
  <div>
    <button class="w-20 border-none mb-8" @click="goBack"> Terug</button>
    <h2>{{businessPlan.title}}</h2>
    <form @submit.prevent="saveAllAnswers">
      <div v-for="business in businessPlan.businessPlanQuetion" :key="business.id">
        <p>{{business.question}}</p>
        <div v-for="value in business.businessPlanValue" :key="value.id">
          <input type="text" v-model="value.value" :readonly="!value.editable" />
          <button @click="toggleEditable(value)">
            <span v-if="value.editable">Opslaan</span>
            <span v-else>Wijzig</span>
          </button>
        </div>
        <div v-if="business.businessPlanValue.length === 0">
          <input type="text" v-model="business.answerValue" placeholder="Enter your answer" />
         
        </div>
      </div>
      <button type="submit">Save All</button>
    </form>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue';
const route = useRoute();
const router = useRouter();
const { data: businessPlan } = await useFetch(`/api/businessPlan/${route.params.id}`);

const saveAllAnswers = async () => {
for (let business of (businessPlan as any).value.businessPlanQuetion) {
    if (business.answerValue) {
      await saveAnswer(business.id, business.answerValue);
    }
  }
};

const saveAnswer = async (businessPlanQuestionId: any, answerValue: any) => {
  try {
    const response = await fetch(`/api/businessValueCreate`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        businessPlanQuetionId: businessPlanQuestionId,
        value: answerValue,
      }),
    });
    const result = await response.json();
    console.log('Answer saved:', result);
  } catch (error) {
    console.error('Error saving answer:', error);
  }
};

const updateValue = async (businessPlanQuestionId: any, businessPlanValueId: any, newValue: any) => {
  try {
    const response = await fetch(`/api/businessValueUpdate`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        id: businessPlanValueId,
        value: newValue,
      }),
    });
    const result = await response.json();
    console.log('Value updated:', result);
  } catch (error) {
    console.error('Error updating value:', error);
  }
};


// Toegevoegde functie om de bewerkbaarheid van de waarde te schakelen en op te slaan
const toggleEditable = async (value: any) => {
  value.editable = !value.editable;
  // Als de waarde gewijzigd is, sla de update op
  if (!value.editable) {
    await updateValue(value.businessPlanQuestionId, value.id, value.value);
  }
};

// Toegevoegde functie om de bewerkbaarheid van het antwoord te schakelen
const toggleAnswerEditable = async (business: any) => {
  business.answerEditable = !business.answerEditable;
  // Als het antwoord gewijzigd is, sla de update op
  if (!business.answerEditable) {
    await saveAnswer(business.id, business.answerValue);
  }
};

const goBack = () => {
  router.back();
};
</script>

<style scoped>
</style>
