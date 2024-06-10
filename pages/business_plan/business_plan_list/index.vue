<template>
  <div class="pb-20">
      <button class="w-20 border-none mb-8" @click="goBack"> Terug</button>
   <business-plan-list />
  </div>
</template>

<script setup>

const router = useRouter();

const goBack = () => {
    router.back();
};

definePageMeta({
  middleware: 'auth',
});

</script>

<style>

</style>
