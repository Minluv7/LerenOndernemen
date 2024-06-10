<template>
  <div>
      <login />
  </div>
</template>

<script>
import login from '~/components/login.vue'
  export default {
  components: { login },
    }
    definePageMeta({
  layout: false,
  middleware: 'guest'
})
</script>

<style scoped>

</style>