<template>
  <div>
    <button class="w-20 border-none mb-8" @click="goBack"> Terug</button>
    <business-plan-detail />
  </div>
</template>

<script setup lang="ts">

const router = useRouter();
const goBack = () => {
  router.back();
};
</script>

<style scoped>
.decrypted-value {
  margin-top: .5rem;
  font-size: .875rem;
  color: #333;
}
</style>