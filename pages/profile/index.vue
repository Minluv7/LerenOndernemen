<template>
    <div v-if="subCategories" class="space">
      <div>
        <h1>Profiel</h1>
        <form class="flex flex-col">
          <label for="email">Email</label>
          <input type="email" id="email" name="email" placeholder="Email" v-model="session.user.email">
          <label for="gebruikersnaam">Gebruikersnaam</label>
          <input type="text" id="gebruikersnaam" name="gebruikersnaam" placeholder="Gebruikersnaam" v-model="session.user.userName">
          <label for="firstName" >Naam</label>
          <input type="text" id="firstName" name="firstName" placeholder="Naam" v-model="session.user.firstName">
          <label for="lastName">Achternaam</label>
          <input type="text" id="lastName" name="lastName" placeholder="Achternaam" v-model="session.user.lastName">
          <input type="submit" value="Opslaan">
        </form>
      
        <p>Je hebt al {{ subCategories.length }} lessen gevolgd</p>
        <h2>Lessens die ik al heb gevolgd</h2>
        <ul>
          <li v-for="subCategory in subCategories" :key="subCategory.id">
          
            <NuxtLink :to="`/curses/${subCategory.subCategory.id}`">
                {{subCategory.subCategory.title}}
            </NuxtLink>
          </li>
        </ul>
      </div>
        <logout-button/>
        <p class="underline text-center pt-4">Account verwijderen</p>
    </div>
</template>

<script setup lang="ts">

const { data: session } = useAuth();
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

definePageMeta({
  middleware: 'auth',
})

</script>


<style scoped>
.space{
    max-width: 90%;
    margin: 0 auto;
}
</style>