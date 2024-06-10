<template>
    <h1>Profiel</h1>
      <form v-if="getUser" @submit.prevent="updateProfile"   >
        <div class="flex flex-col pt-4">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" placeholder="Email" v-model="getUser.email">
        </div>
      <div class="flex flex-col pt-4">
        <label for="gebruikersnaam">Gebruikersnaam</label>
        <input v-if="getUser" type="text" id="gebruikersnaam" name="gebruikersnaam" placeholder="Gebruikersnaam" v-model="getUser.userName">
       </div>
       <div class="flex flex-col pt-4">
        <label for="firstName">Naam</label>
        <input v-if="getUser" type="text" id="firstName" name="firstName" placeholder="Naam" v-model="getUser.firstName">
       </div>
       <div class="flex flex-col pt-4">
        <label for="lastName">Achternaam</label>
        <input v-if="getUser" type="text" id="lastName" name="lastName" placeholder="Achternaam" v-model="getUser.lastName">
       </div>
  
        <button class="border-none max-w-fit mt-4" type="submit">Opslaan</button>
      </form>
</template>

<script setup lang="ts">

const {data: getUser, error} = useFetch('/api/userData');
if (error.value) {
  console.error('Fout bij ophalen gebruikersgegevens:', error.value);
}
const updateProfile = async () => {
  try {
    const response = await fetch(`/api/userUpdate`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        //@ts-expect-error
        id: getUser.value?.id,
         //@ts-expect-error
        email: getUser.value?.email,
         //@ts-expect-error
        userName: getUser.value?.userName,
         //@ts-expect-error
        firstName: getUser.value?.firstName,
         //@ts-expect-error
        lastName: getUser.value?.lastName,
      }),
    });

    if (!response.ok) {
      throw new Error(`Server fout: ${response.status}`);
    }

    const result = await response.json();
    console.log('Profiel geüpdatet:', result); // Debug logging
      //refreshNuxtData()
   
  } catch (error) {
    console.error('Er is een fout opgetreden bij het updaten van het profiel:', error);
  }
};

</script>

<style scoped>
input{
  padding: 0.5rem;
  border-radius: 0.8rem;
  width: 70%;

}
</style>