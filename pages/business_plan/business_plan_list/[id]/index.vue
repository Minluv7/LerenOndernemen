<template>
<div>
<h2>{{businessPlan.title}}</h2>
    <div v-for="business in businessPlan.businessPlanQuetion" :key="business.id">
        <p>{{business.question}}</p>
        <form action="" v-for="value in business.businessPlanValue" :key="value.id" >
            {{value.value}}
        </form>
    </div>
    </div>
</template>

<script setup lang="ts">
const route = useRoute();
const { data: businessPlan } = await useFetch(`/api/businessPlan/${route.params.id}`);

</script>

<style scoped>

</style>