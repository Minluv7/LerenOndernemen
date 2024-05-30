<template>
<div>
<h2>{{businessPlan.title}}</h2>
    <div v-for="business in businessPlan.businessPlanQuetion" :key="business.id">
        <p>{{business.question}}</p>
       
    </div>
    </div>
</template>

<script setup lang="ts">
const route = useRoute();
const { data: businessPlan } = await useFetch(`/api/businessPlan/${route.params.id}`);
console.log(businessPlan);
</script>

<style scoped>

</style>