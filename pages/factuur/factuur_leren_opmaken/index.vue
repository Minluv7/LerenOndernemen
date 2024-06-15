<template>
<div  class="space">
    <button class="w-20 border-none mb-8" @click="goBack"> Terug</button>
    <invoiceFormatPage/>
  </div>
</template>

<script setup lang="ts">
import invoiceFormatPage  from "@/components/invoiceFormatPage.vue";
definePageMeta({
  middleware: 'auth',
})


const router = useRouter()

const goBack = () => {
    router.back()
}


</script>


<style scoped>
.space {
  max-width: 90%;
  margin: 0 auto;
}
</style>