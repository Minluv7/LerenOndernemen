<template>
    <div class="space">
      <h1 class="text-center">Welkom {{data.user.userName}}</h1>
      <img src="../../assets/image/homePage/home.png" alt="home_page_image">
      
    </div>
</template>

<script setup lang="ts">
definePageMeta({
  middleware: 'auth',
})

const {data} = useAuth();

</script>


<style scoped>
.space {
  max-width: 90%;
  margin: 0 auto;
}
</style>

