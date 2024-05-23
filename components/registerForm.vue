<template>
  <form @submit.prevent="handleRegister" class="space-y-4 md:space-y-6">
    <div class="flex justify-between">
      <div>
        <label 
          for="lastName"  
          class="block mb-2 text-sm font-medium text-gray-900"
          >Naam</label
          >
        <input
          v-model="form.firstName"
          type="text"
          name="name"
          id="name"
          class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 "
          placeholder="naam"
          required=""
        />
      </div>
      <div>
        <label
          for="firstName"
          class="block mb-2 text-sm font-medium text-gray-900"
          >Voornaam</label
        >
        <input
          v-model="form.lastName"
          type="text"
          name="voorname"
          id="voorname"
          class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 "
          placeholder="Voornaam"
          required=""
        />
      </div>
    </div>
    <div>
        <label
            for="userName"
            class="block mb-2 text-sm font-medium text-gray-900"
            >Gebruikersnaam</label
        >
        <input
        v-model="form.userName"
            type="text"
            name="userName"
            id="userName"
            class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 "
            placeholder="gebruikersnaam"
            required=""
        />
    </div>
    <div>
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
    <div >
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
        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 "
        required=""
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

<script lang="ts" setup >
const form = ref({
  userName: '',
  email: '',
  password: ''
})

const isLoading = ref(false);

async function handleRegister(){
  try {
    isLoading.value = true;
    await useFetch('/api/auth/register', {
      method: 'POST',
      body: form.value
 });

    useRouter().push(
       "/login",
    );
 } catch(e: any) {
   console.error(e)
 }
 finally {
   isLoading.value = false;
 }
}
</script>