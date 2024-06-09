<template>
     <div v-if="subCategories">
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
</template>

<script setup lang="ts">
const { data: fetchedSubCategories, error } = useFetch('/api/viewedLesson');

if (error.value) {
  console.error('Fout bij ophalen subCategorieën:', error.value);
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


</script>

<style scoped>

</style>