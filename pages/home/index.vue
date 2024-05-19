<template>
    <div class="space">
      <h1 class="text-center">Welkom {{data.user.userName}}</h1>
      <img src="../../assets/image/homePage/home.png" alt="home_page_image">
      <div v-if="subCategories">
        <h2>Onze vreschillende lessen</h2>
        <ul>
          <li v-for="sub in subCategories" :key="sub.id">
            <h3>{{ sub.name }}</h3>
            <img :src="sub.image" :alt="sub.title">
          </li>
        </ul>
      </div>
      <div>
        <h2>Motivatie van de dag</h2>
      </div>
    </div>
</template>

<script setup lang="ts">
definePageMeta({
  middleware: 'auth',
})

const {data} = useAuth();
const { data: subCategories } = await useFetch('/api/firstSubCategories');

</script>


<style scoped>
.space {
  max-width: 90%;
  margin: 0 auto;
}
</style>

