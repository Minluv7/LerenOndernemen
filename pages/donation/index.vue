<template>
    <div class="space">
        <h1 class="text-center">Buy me a coffee</h1>
        <div class="pt-8 flex justify-center">
            <img width="200rem" src="assets/image/donation/buy_me_a_coffee.png" alt="coffee image">
        </div>
        <p class="text-center pt-8">Om mij te ondersteunen bij het maken van deze gratis inhoud en het onderhouden van mijn werk, kun je overwegen een donatie te doen via mijn Ko-fi-pagina.</p>
        <div class="flex justify-center pt-8">
            <a class="" href='https://ko-fi.com/W7W6W1RX4' target='_blank'><img height='36' style='border:0px;height:36px;' src='https://storage.ko-fi.com/cdn/kofi2.png?v=3' border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>
        </div>
        
    </div>
</template>

<script setup lang="ts">
definePageMeta({
  middleware: 'auth',
})
</script>

<style scoped>
.space{
    max-width: 90%;
    margin: 0 auto;
    padding-bottom: 6rem;
}

</style>