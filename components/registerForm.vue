<template>
  <form @submit.prevent="handleRegister" class="space-y-4 md:space-y-6">
      <p v-if="errorMessage" class="text-red-500">{{ errorMessage }}</p>
    <div class="flex justify-between">
      <div>
        <label for="lastName" class="block mb-2 text-sm font-medium text-gray-900">Voornaam</label>
        <input
          v-model="form.firstName"
          type="text"
          name="voornaam"
          id="voornaam"
          class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
          placeholder="Voornaam"
          required
        />
      </div>
      <div>
        <label for="firstName" class="block mb-2 text-sm font-medium text-gray-900">Familienaam</label>
        <input
          v-model="form.lastName"
          type="text"
          name="achternaam"
          id="name"
          class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
          placeholder="Achternaam"
          required
        />
      </div>
    </div>
    <div>
      <label for="userName" class="block mb-2 text-sm font-medium text-gray-900">Gebruikersnaam</label>
      <input
        v-model="form.userName"
        type="text"
        name="userName"
        id="userName"
        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
        placeholder="gebruikersnaam"
        required
      />
    </div>
    <div>
      <label for="email" class="block mb-2 text-sm font-medium text-gray-900">E-mail</label>
      <input
        v-model="form.email"
        type="email"
        name="email"
        id="email"
        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
        placeholder="naam@hotmail.com"
        required
      />
    </div>
    <div>
      <label for="password" class="block mb-2 text-sm font-medium text-gray-900">Wachtwoord</label>
      <input
        v-model="form.password"
        type="password"
        name="password"
        id="password"
        placeholder="••••••••"
        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
        required
      />
    </div>
    <button
      :disabled="isLoading"
      type="submit"
      class="text-white shadow-md border-none flex"
      :class="{ 'opacity-20 cursor-not-allowed': isLoading }"
    >
      Registreer
    </button>
  
  </form>
</template>

<script lang="ts" setup>

const router = useRouter();

const form = ref({
  userName: '',
  email: '',
  password: '',
  firstName: '',
  lastName: '',
});


const isLoading = ref(false);
const errorMessage = ref('');

async function handleRegister() {
  try {
    isLoading.value = true;
    errorMessage.value = '';

    const response = await fetch('/api/auth/register', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(form.value),
    });

    if (!response.ok) {
      const errorData: any = await response.json();
      throw new Error(errorData.message || 'Registration failed');
    }

    router.push('/login');
  } catch (e: any) {
    errorMessage.value = e.message;
  } finally {
    isLoading.value = false;
  }
}
</script>
