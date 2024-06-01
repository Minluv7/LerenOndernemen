<template>
    <div v-if="subCategories" class="space">
      <div>
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
    </div>
</template>

<script setup lang="ts">


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