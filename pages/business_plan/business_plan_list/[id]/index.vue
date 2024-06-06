<template>
  <div>
    <button class="w-20 border-none mb-8" @click="goBack"> Terug</button>
    <h2 class="pb-4">{{businessPlan.title}}</h2>
    <form @submit.prevent="saveAllAnswers" class="pb-24">
      <div v-for="business in businessPlan.businessPlanQuetion" :key="business.id" class="pb-8">
        <label for="input-field">
          {{business.question}} <span style="color: red">*</span>
        </label>
        <div v-for="value in business.businessPlanValue" :key="value.id" class="flex flex-col gap-4">
          <textarea 
            v-model="value.value" 
            cols="20" 
            rows="5" 
            class="p-4"
            required>
          </textarea>
        </div>
        <div v-if="business.businessPlanValue.length === 0" class="flex flex-col gap-4 pt-4">
          <textarea 
            v-model="business.answerValue" 
            cols="full" 
            rows="5" 
            class="p-4" 
            placeholder="Schrijf je antwoord">
          </textarea>
        </div>
      </div>
      <button class="max-w-fit border-none" type="submit">Opslaan</button>
    </form>
  </div>
</template>

<script setup lang="ts">

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

const goBack = () => {
  router.back();
};
</script>



<style scoped>
</style>
