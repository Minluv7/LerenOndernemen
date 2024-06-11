<template>
    <div class="space">
      <h1 class="text-center pt-8 text-wrap">{{ category.name }}</h1>
      <div class="flex justify-center">
        <ul class="grid-container pt-8 pb-20">
          <li v-for="sub in category.subCategories" :key="sub.id" class="grid-item rounded-3xl bg-[#BADBE7]">
            <NuxtLink :to="`/${sub.slug}`" class="flex flex-col p-4 gap-4 items-center justify-between" @click="markAsViewed(sub.id)">
              <img  class="w-[8rem] h-[10rem] object-cover sub-image" :src="sub.image" :alt="sub.title" />
              <h3 >{{ sub.title }}</h3>
              <div v-if="sub.viewed" class="viewed-badge">✔️</div>
            </NuxtLink>
          </li>
        </ul>
      </div>
    </div>
</template>

<script setup lang="ts">
import { useRouter } from 'vue-router';

const route = useRoute();
const router = useRouter();
const { data: category } = await useFetch(`/api/category/${route.params.id}`);

const markAsViewed = async (subCategoryId: any) => {
  // Haal de subcategorie op
  const sub = (category.value as { subCategories: any[] }).subCategories.find((sub: any) => sub.id === subCategoryId);

const excludedSlugs = ["notaris", "btw_aanvraag", "sociaal_secreteriaat", "vergunning", "eenmans_vennootschap", "jaarrekening_pb_vb"];
  // Controleer of de subcategorie niet verwijst naar de exclusieve pagina's
 if (!excludedSlugs.includes(sub.slug)) {
    // Voer het postverzoek uit om de subcategorie als bekeken te markeren
    await $fetch('/api/markViewed', {
      method: 'POST',
      body: { subCategoryId }
    });
  } else {
    // Als de subcategorie verwijst naar de exclusieve pagina's, doe hier iets anders, bijv. een waarschuwing tonen
    console.log("Deze subcategorie verwijst naar de exclusieve pagina's.");
    // Of navigeer naar een andere pagina
    router.push('/will_come');
  }
}
</script>


<style scoped>

.space {
  max-width: 90%;
  margin: 0 auto;
}

.vh {
  height: 45vh;
}

.grid-container {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-template-rows: repeat(2, auto);
  gap: 2rem;
  align-items: stretch;
}

.grid-item {
  list-style: none; 
  padding: 0;
}

.text-wrap {
  overflow-wrap: break-word;
}

.sub-image {
  max-width: 100%;
  max-height: 100%;
  object-fit: contain;
}

</style>