<template>
    <div class="space">
        <h1 class="text-center pt-8">Cursussen</h1>
        <grid-categories/>
    </div>
</template>

<script setup lang="ts">
definePageMeta({
  middleware: 'auth',
})

</script>

<style scoped>
.space {
  max-width: 90%;
  margin: 0 auto;
}


</style>