<template>
    <div>
       <h1>Welkom {{data.user.userName}}</h1>
    </div>
</template>

<script setup lang="ts">
definePageMeta({
  middleware: 'auth',
})

const {data} = useAuth();

</script>


<style scoped>

</style>

