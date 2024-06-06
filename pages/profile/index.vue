<template>
  <div v-if="subCategories" class="space">
    <div >
      <h1>Profiel</h1>
      <form v-if="getUser" @submit.prevent="updateProfile"   >
        <div class="flex flex-col pt-4">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" placeholder="Email" v-model="getUser.email">
        </div>
      <div class="flex flex-col pt-4">
        <label for="gebruikersnaam">Gebruikersnaam</label>
        <input type="text" id="gebruikersnaam" name="gebruikersnaam" placeholder="Gebruikersnaam" v-model="getUser.userName">
       </div>
       <div class="flex flex-col pt-4">
        <label for="firstName">Naam</label>
        <input type="text" id="firstName" name="firstName" placeholder="Naam" v-model="getUser.firstName">
       </div>
       <div class="flex flex-col pt-4">
        <label for="lastName">Achternaam</label>
        <input type="text" id="lastName" name="lastName" placeholder="Achternaam" v-model="getUser.lastName">
       </div>
  
        <button class="border-none max-w-fit mt-4" type="submit">Opslaan</button>
      </form>
   
      <h2 class="pt-4">Lessen die je al hebt gevolgd</h2>
      <ul class="pt-1">
        <li v-for="subCategory in subCategories" :key="subCategory.id">
          <NuxtLink :to="`/curses/${subCategory.subCategory.id}`">
            -  {{subCategory.subCategory.title}}
          </NuxtLink>
        </li>
      </ul>
        <p  class="pt-4">Je hebt al {{ subCategories.length }} lessen gevolgd</p>
    </div>
    <logout-button class="pt-4"/>
    <button @click="confirmDeleteAccount" class="underline text-center pt-8 border-none bg-transparent text-[#013a63]">Account verwijderen</button>
  </div>
</template>

<script setup lang="ts">


const {data: getUser} = useFetch('/api/userData');
const { data: fetchedSubCategories, error } = useFetch('/api/viewedLesson');

if (error.value) {
  console.error('Fout bij ophalen gebruikersgegevens:', error.value);
}

const subCategories = ref([]);
watchEffect(() => {
  if (fetchedSubCategories.value) {
    // @ts-expect-error
    subCategories.value = fetchedSubCategories.value.reduce((unique: any, item: any) => {
      return unique.some((u: { subCategory: { id: any; }; }) => u.subCategory.id === item.subCategory.id) ? unique : [...unique, item];
    }, []);
  }
});


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

const confirmDeleteAccount = () => {
  // @ts-expect-error
  if (confirm('Weet je zeker dat je je account wilt verwijderen? Deze actie kan niet ongedaan worden gemaakt.')) {
    deleteAccount();
  }
};


const {data, signOut} = useAuth();
const router = useRouter();

const deleteAccount = async () => {
  try {
    const response = await fetch(`/api/userDelete`, {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json',
      },
    });

    if (!response.ok) {
      throw new Error(`Server fout: ${response.status}`);
    }

    const result = await response.json();
    console.log('Account verwijderd:', result);

      await signOut();

  } catch (error) {
    console.error('Er is een fout opgetreden bij het verwijderen van het account:', error);
  }
};

definePageMeta({
  middleware: 'auth',
})
</script>

<style scoped>
.space {
  max-width: 90%;
  margin: 0 auto;
  margin-bottom: 8rem;
}
input{
    padding: 0.5rem;
    border-radius: 1rem;
    width: 100%;

}
</style>