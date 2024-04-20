<template>
  <div>
    <!-- Navigation -->
    <header class="shadow-sm bg-white">
      <!-- Logo -->
      <div class="container mx-auto p-4">
        <NuxtLink to="/home" class="font-bold"><img src="assets/image/Logo.png" alt="Logo"></NuxtLink>
      </div>
    </header>

     <!-- Desktop Navigation -->
    <header class="shadow-sm bg-white hidden lg:block">
      <nav class="container mx-auto p-4 flex justify-between">
        <ul class="flex gap-4">
          <li><NuxtLink to="/home">Home</NuxtLink></li>
          <li><NuxtLink to="/cursess">Cursussen</NuxtLink></li>
          <li><NuxtLink to="/donation">Donatie</NuxtLink></li>
          <li><NuxtLink to="/profile">Profiel</NuxtLink></li>
        </ul>
        <NuxtLink to="/" class="btn">Loguit</NuxtLink>
      </nav>
    </header>

    <!-- Mobile Navigation -->
    <nav class="fixed bottom-0 left-0 right-0 bg-white shadow-lg lg:hidden" v-if="isMobile">
      <ul class="flex justify-between container mx-auto p-4">
        <li><NuxtLink to="/home" exact>Home</NuxtLink></li>
        <li><NuxtLink to="/cursess">Cursussen</NuxtLink></li>
        <li><NuxtLink to="/donation">Donatie</NuxtLink></li>
        <li><NuxtLink to="/profile">Profiel</NuxtLink></li>
      </ul>
    </nav>

    <!-- Page content -->
    <div class="container mx-auto p-4">
      <slot />
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      isMobile: false
    };
  },
  mounted() {
    this.checkWindowSize();
    window.addEventListener('resize', this.checkWindowSize);
  },
  beforeDestroy() {
    window.removeEventListener('resize', this.checkWindowSize);
  },
  methods: {
    checkWindowSize() {
      this.isMobile = window.innerWidth < 610 || window.innerHeight < 788;
    }
  }
};
</script>

<style scoped>
.router-link-active {
  color: red;
}
</style>
