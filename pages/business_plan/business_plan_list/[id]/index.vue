<template>
  <div>
    <button class="w-20 border-none mb-8" @click="goBack">Terug</button>
    <h2 v-if="businessPlan" class="pb-4">{{ businessPlan.title }}</h2>
    <form v-if="businessPlan" @submit.prevent="saveAllAnswers" class="pb-24">
      <div v-for="business in businessPlan.businessPlanQuetion" :key="business.id" class="pb-8">
        <label for="input-field">
          {{ business.question }} <span style="color: red">*</span>
        </label>
        <div v-for="value in business.businessPlanValue" :key="value.id" class="flex flex-col gap-4">
          <textarea
            :value="getDecryptedValue(value.value)"
            @input="(event) => handleInput(business.id, value.id, event)"
            cols="20"
            rows="5"
            class="p-4"
            required
          ></textarea>
        </div>
        <div v-if="business.businessPlanValue.length === 0" class="flex flex-col gap-4 pt-4">
          <textarea v-model="business.answerValue" cols="20" rows="5" class="p-4" placeholder="Schrijf je antwoord"></textarea>
        </div>
      </div>
      <button class="max-w-fit border-none" type="submit" :disabled="isSaving">Opslaan</button>
    </form>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue';
import { useRouter, useRoute } from 'vue-router';
import AES from 'crypto-js/aes';
import Utf8 from 'crypto-js/enc-utf8';

const router = useRouter();
const route = useRoute();

const encryptionKey = process.env.SECRET_KEY || 'SECRET_KEY';

// Function to encrypt value
const encryptValue = (value: string) => {
  return AES.encrypt(value, encryptionKey).toString();
};

// Function to decrypt value
const decryptValue = (encryptedValue: string) => {
  try {
    const bytes = AES.decrypt(encryptedValue, encryptionKey);
    return bytes.toString(Utf8);
  } catch (error) {
    console.error('Error decrypting value:', error);
    return null;
  }
};

// Method to get decrypted value
const getDecryptedValue = (encryptedValue: string) => {
  return decryptValue(encryptedValue);
};

const handleInput = (businessPlanQuestionId: any, businessPlanValueId: any, event: any) => {
  const newValue = event.target.value;
  updateValue(businessPlanQuestionId, businessPlanValueId, newValue);
};

const isSaving = ref(false); // Flag to prevent multiple submissions
const errorMessage = ref(''); // Variable to store error messages

const saveAllAnswers = async () => {
  if (isSaving.value) return; // Prevent multiple submissions

  isSaving.value = true; // Set the flag to true
  errorMessage.value = ''; // Reset error message

  try {
    for (let business of (businessPlan as any).value.businessPlanQuetion) {
      if (business.answerValue) {
        const response = await saveAnswer(business.id, encryptValue(business.answerValue));
        if (!response) {
          response;
          break; // Stop processing further if an error occurs
        }
      }
    }
      router.back();
  } finally {
    isSaving.value = false; // Reset the flag after the operation
  }
};

const saveAnswer = async (businessPlanQuestionId: any, encryptedValue: any) => {
  try {
    const response = await fetch(`/api/businessValueCreate`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        businessPlanQuetionId: businessPlanQuestionId,
        value: encryptedValue,
      }),
    });

    if (!response.ok) {
      throw new Error(`Server fout: ${response.status}`);
    }

    return await response.json();
  } catch (error) {
    console.error('Error saving answer:', error);
    return { success: false, message: 'Er is een fout opgetreden bij het opslaan van het antwoord.' };
  }
};

const updateValue = async (businessPlanQuestionId: any, businessPlanValueId: any, newValue: any) => {
  try {
    const encryptedValue = encryptValue(newValue);
    const response = await fetch(`/api/businessValueUpdate`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        id: businessPlanValueId,
        value: encryptedValue,
      }),
    });

    if (!response.ok) {
      throw new Error(`Server fout: ${response.status}`);
    }

    const result = await response.json();
    console.log('Value updated:', result);
  } catch (error) {
    console.error('Error updating value:', error);
  }
};

const { data: businessPlan } = await useFetch(`/api/businessPlan/${route.params.id}`);

const goBack = () => {
  router.back();
};
definePageMeta({
  middleware: 'auth',
});
</script>

<style scoped>
.space {
  max-width: 90%;
  margin: 0 auto;
  margin-bottom: 8rem;
}
input {
  padding: 0.5rem;
  border-radius: 1rem;
  width: 100%;
}
</style>
