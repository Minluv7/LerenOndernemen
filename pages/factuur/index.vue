<template>
    <div class="space pb-32">
        <lessonsPages />
        <NuxtLink class="flex justify-center pt-8"  :to="'/factuur/factuur_leren_opmaken'">
        <button class="max-w-fit border-none">Factuur leren opmaken</button>
        </NuxtLink>
         <NuxtLink class="flex justify-center pt-8"  :to="'/factuur/factuur_testen'">
        <button class="max-w-fit border-none">Factuur kennis testen</button>
        </NuxtLink>
        <a :href="excelFilePath" download="factuur_sjabloon.xlsx" class="flex gap-2 justify-center pt-8">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
                <rect width="16" height="16" fill="white" fill-opacity="0.01"/>
                <path fill-rule="evenodd" clip-rule="evenodd" d="M8.00002 1.11914C8.26512 1.11914 8.48002 1.33404 8.48002 1.59914V8.97365L10.8607 6.59306C11.0481 6.4056 11.352 6.4056 11.5394 6.59306C11.7269 6.78052 11.7269 7.08443 11.5394 7.27189L8.33943 10.4719C8.15198 10.6593 7.84806 10.6593 7.66061 10.4719L4.46061 7.27189C4.27315 7.08443 4.27315 6.78052 4.46061 6.59306C4.64806 6.4056 4.95198 6.4056 5.13943 6.59306L7.52002 8.97365V1.59914C7.52002 1.33404 7.73492 1.11914 8.00002 1.11914ZM2.66663 10.6658C2.96118 10.6658 3.19997 10.9046 3.19997 11.1992V12.7992C3.19997 13.39 3.67533 13.8658 4.26274 13.8658H11.7346C12.3231 13.8658 12.8 13.3888 12.8 12.7992V11.1992C12.8 10.9046 13.0388 10.6658 13.3333 10.6658C13.6278 10.6658 13.8666 10.9046 13.8666 11.1992V12.7992C13.8666 13.9769 12.9132 14.9325 11.7346 14.9325H4.26274C3.08284 14.9325 2.1333 13.9757 2.1333 12.7992V11.1992C2.1333 10.9046 2.37208 10.6658 2.66663 10.6658Z" fill="#0F172A"/>
            </svg>
            <p class="underline">Download Factuur Sjabloon</p>
        </a>
    </div>
</template>

<script setup lang="ts">
const excelFilePath = '/factuur_sjabloon.xlsx'
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