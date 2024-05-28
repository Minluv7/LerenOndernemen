<template>
   <div class="flex flex-col items-center justify-center px-6 py-8 mx-auto h-screen lg:py-0">
    
    <div class=" w-full bg-white rounded-lg shadow-md md:mt-0 sm:max-w-md xl:p-0">

        <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
            <a href="/">
                <div class="flex justify-end">
                    X
                </div>
            </a> 
            <div class="flex flex-col items-center">
               
                <div class="w-40">
                    <img src="/assets/image/logos/logo@2x.png" alt="logo">
                </div>
                 <p class="text-xl font-bold md:text-xl">
                    Login om verder te gaan
                </p>
            </div>
            <LoginForm />
            <p class="text-sm flex flex-col font-light" >
                Heb je nog geen account?
                <a
                    href="/register"
                    class="font-medium text-primary-600 hover:underline"
                    >Registreer
                </a>
            </p>
        </div>

    </div>
    
    </div>
</template>

<script>

</script>

<style scoped>

</style>