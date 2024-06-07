<template>
  <div>
    <button class="w-20 border-none mb-8" @click="goBack"> Terug</button>
    <h2 class="pb-4">{{ businessPlan.title }}</h2>
    <form @submit.prevent="saveAllAnswers" class="pb-24">
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
          <textarea v-model="business.answerValue" cols="full" rows="5" class="p-4" placeholder="Schrijf je antwoord"></textarea>
        </div>
      </div>
      <button class="max-w-fit border-none" type="submit">Opslaan</button>
    </form>
  </div>
</template>

<script setup lang="ts">
import AES from 'crypto-js/aes'; // Import AES directly
import Utf8 from 'crypto-js/enc-utf8'; // Import Utf8 encoding for decryption

const route = useRoute();
const router = useRouter();
const { data: businessPlan } = await useFetch(`/api/businessPlan/${route.params.id}`);

// Encryption key, replace with a secure key
const encryptionKey = process.env.SECRET_KEY || 'SECRET_KEY';

// Function to encrypt value
const encryptValue = (value: string) => {
  return AES.encrypt(value, encryptionKey).toString(); // Use AES instead of CryptoJS
};

// Function to decrypt value
const decryptValue = (encryptedValue: string) => {
  const bytes = AES.decrypt(encryptedValue, encryptionKey);
  return bytes.toString(Utf8);
};

// Method to get decrypted value
const getDecryptedValue = (encryptedValue: string) => {
  return decryptValue(encryptedValue);
};

const handleInput = (businessPlanQuestionId: any, businessPlanValueId: any, event: any) => {
  const newValue = event.target.value;
  updateValue(businessPlanQuestionId, businessPlanValueId, newValue);
};


const saveAllAnswers = async () => {
  for (let business of (businessPlan as any).value.businessPlanQuetion) {
    if (business.answerValue) {
      await saveAnswer(business.id, encryptValue(business.answerValue));
    }
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
    const result = await response.json();
    console.log('Answer saved:', result);
  } catch (error) {
    console.error('Error saving answer:', error);
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
.decrypted-value {
  margin-top: .5rem;
  font-size: .875rem;
  color: #333;
}
</style>
