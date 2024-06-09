<template>
  <form @submit.prevent="handleLogin" class="space-y-4 md:space-y-6">
    <div>
      <div v-if="loginError" class="text-red-500">{{ loginError }}</div>
      <label for="email" class="block mb-2 text-sm font-medium">E-mail</label>
      <input
        v-model="form.email"
        type="email"
        name="email"
        id="email"
        class="bg-gray-50 border border-gray-300 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
        placeholder="naam@hotmail.com"
        required
      />
    </div>
    <div>
      <label for="password" class="block mb-2 text-sm font-medium">Wachtwoord</label>
      <input
        v-model="form.password"
        type="password"
        name="password"
        id="password"
        placeholder="••••••••"
        class="bg-gray-50 border border-gray-300 sm:text-sm rounded-lg block w-full p-2.5"
        required
      />
    </div>
    <div class="flex items-center justify-end">
      <a href="#" class="text-sm font-medium text-primary-600 hover:underline">Wachtwoord vergeten?</a>
    </div>
    <button type="submit" class="shadow-md border-none flex w-full text-blue-50 rounded-lg p-2">Login</button>
  </form>
</template>

<script lang="ts" setup>
import { ref } from 'vue';
import { useRouter } from 'vue-router';
const { signIn } = useAuth();

const router = useRouter();

const form = ref({
  email: '',
  password: ''
});

const loginError = ref<string | null>(null); // Gebruik ref voor reactiviteit

async function handleLogin() {
  loginError.value = null; // Reset de foutmelding

  try {
    const response = await signIn('credentials', {
      redirect: false, // Voeg dit toe om te voorkomen dat de gebruiker wordt doorgestuurd
      ...form.value
    });

    if (response?.error) {
      loginError.value = response.error; // Stel de foutmelding in
    } else {
      // Als login succesvol is, navigeer naar de gewenste pagina, bijvoorbeeld:
      router.push('/home');
    }
  } catch (error) {
    console.error('Fout bij het inloggen:', error);
    loginError.value = 'Er is iets misgegaan. Probeer het opnieuw.'; // Algemene foutmelding voor onverwachte fouten
  }
}
</script>
<style>
.text-color-blue {
  color: #7AA5B8;
}
</style>