<template>
    <div>
        event id: {{ $route.params.id }}
    </div>
</template>

<script setup>
    import { ref } from 'vue'

definePageMeta({
  middleware: 'auth',
})

</script>