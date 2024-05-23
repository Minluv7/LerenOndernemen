<template>
  <form @submit.prevent="handleLogin" class="space-y-4 md:space-y-6" >
   
    <div>
       <div v-if="loginError" class="text-red-500">{{ loginError }}</div>
      <label
        for="email"
        class="block mb-2 text-sm font-medium text-gray-900"
        >E-mail</label
      >
      <input
      v-model="form.email"
        type="email"
        name="email"
        id="email"
        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 "
        placeholder="naam@hotmail.com"
        required=""
      />
    </div>
    <div>
      <label
        for="password"
        class="block mb-2 text-sm font-medium text-gray-900 "
        >Wachtwoord</label
      >
      <input
      v-model="form.password"
        type="password"
        name="password"
        id="password"
        placeholder="••••••••"
        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
        required=""
      />
    </div>
    <div class="flex items-center justify-between">
      <a
        href="#"
        class="text-sm font-medium text-primary-600 hover:underline dark:text-primary-500"
        >Wachtwoord vergeten?</a
      >
    </div>
      <button
        type="submit"
        @click="handleLogin"
        class=" shadow-md border-none flex w-full text-blue-50 rounded-lg p-2"
      >
        Login
      </button>
     
  </form>
</template>

<style>
.text-color-blue {
  color: #7AA5B8;
}
</style>

<script lang="ts" setup>

import { ref } from 'vue';


const router = useRouter();

const form = ref({
  email: '',
  password: ''
});

let loginError = '';
const { signIn } = useAuth();

async function handleLogin() {
  try {

    await signIn('credentials', form.value);

  } catch (error) {
    console.error('Fout bij het inloggen:', error);
    loginError = (error as Error).message;
  }
}


</script>
