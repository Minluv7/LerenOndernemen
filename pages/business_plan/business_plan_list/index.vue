<template>
    <div >
        <ul >
            <li v-for="business in businessPlan" :key="business.id">
                <NuxtLink :to="`/business_plan/business_plan_list/${business.id}`" class="flex gap-4" >
                    <p>{{business.id}}</p>
                    <p>{{business.title}}</p>
                </NuxtLink>
            </li>
        </ul>
    </div>
</template>

<script setup lang="ts">

const {data: businessPlan} = await useFetch ('/api/businessPlan')
definePageMeta({
  middleware: 'auth',
})

</script>

<style scoped>

</style>