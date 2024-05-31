<template>
  <div>
    <h2>{{businessPlan.title}}</h2>
       <form @submit.prevent="saveAllAnswers">
      <div v-for="business in businessPlan.businessPlanQuetion" :key="business.id">
        <p>{{business.question}}</p>
        <div v-for="value in business.businessPlanValue" :key="value.id">
          <input type="text" v-model="value.value" />
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
</script>

<style scoped>

</style>
