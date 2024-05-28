<template>
    <div>
        profile
        <logout-button/>
    </div>
</template>

<script setup lang="ts">
definePageMeta({
  middleware: 'auth',
})
</script>


<style scoped>

</style>