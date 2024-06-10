<template>
    <div>
      <button class="w-20 border-none mb-8" @click="goBack"> Terug</button>
      <p>Deze pagina is nog niet volledig klaar en zal binnenkort beschikbaar zijn. <br> Bedankt voor uw begrip!</p>
      <div class="flex justify-center">
          <img src="assets/image/willCome/settings.gif" alt="settings gif">
      </div>
    </div>
</template>

<script setup lang="ts">
definePageMeta({
  middleware: 'auth',
})

const router = useRouter();

const goBack = () => {
    router.back();
};

</script>

<style scoped>

</style>