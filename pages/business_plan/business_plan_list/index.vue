<template>
    <div>
        <ul class="flex gap-4 flex-col">
            <NuxtLink
                v-for="business in businessPlan"
                :key="business.id"
                :to="`/business_plan/business_plan_list/${business.id}`"
                class="rounded-md border border-[#61A5C2] p-4 h-20 content-center hover:bg-[#61A5C2] hover:text-white transition duration-300 business-item"
            >
                <li class="flex gap-4">
                    <p>{{ business.id }}.</p>
                    <p>{{ business.title }}</p>
                </li>
            </NuxtLink>
        </ul>
    </div>
</template>

<script setup lang="ts">
const { data: businessPlan } = await useFetch('/api/businessPlan');
definePageMeta({
  middleware: 'auth',
});
</script>

<style>

.business-item:hover li p {
  color: white;
}
</style>
