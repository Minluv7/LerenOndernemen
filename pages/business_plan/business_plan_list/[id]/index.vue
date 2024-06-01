<template>
  <div>
    <button class="w-20 border-none mb-8" @click="goBack"> Terug</button>
    <h2 class="pb-4">{{businessPlan.title}}</h2>
    <form @submit.prevent="saveAllAnswers" class="pb-24">
      <div v-for="business in businessPlan.businessPlanQuetion" :key="business.id" class="pb-8">
        <label for="input-field">
         {{business.question}}
        </label>
        <div v-for="value in business.businessPlanValue" :key="value.id" class="flex flex-col gap-4">
           <button class="max-w-max place-self-end border-none" @click="toggleEditable(value)">
            <span v-if="value.editable">Opslaan</span>
            <span v-else>Wijzig</span>
          </button>
          <!-- <input type="text" v-model="value.value" :readonly="!value.editable" class="w-full h-12 p-4" /> -->
          <textarea type="text" v-model="value.value" :readonly="!value.editable" cols="20" rows="5" class=" p-4"></textarea>
        </div>
        <div  v-if="business.businessPlanValue.length === 0" class="flex flex-col gap-4 pt-4">
          <!-- <input type="text" v-model="business.answerValue" placeholder="Enter your answer" /> -->
           <textarea type="text" v-model="business.answerValue" cols="full" rows="5" class=" p-4" placeholder="Schrijf je antwoord"></textarea>
        </div>
      </div>
      <button type="submit">Opslaan</button>
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
