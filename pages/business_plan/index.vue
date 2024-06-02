<template>
    <div  class="space">
        <lessonsPages />
        <NuxtLink class="flex justify-center pt-8" :to="'/business_plan/business_plan_list'">
        <button class="max-w-fit border-none ">Businessplan leren opmaken</button></NuxtLink>
    </div>
</template>

<script setup lang="ts">
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