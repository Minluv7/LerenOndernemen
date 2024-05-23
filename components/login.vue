<template>
   <div class="flex flex-col items-center justify-center px-6 py-8 mx-auto h-screen lg:py-0">
    
    <div class=" w-full h-full bg-white rounded-lg shadow-md md:mt-0 sm:max-w-md xl:p-0">
        
        <!-- <div class="flex justify-between mb-[-14rem]" >
            <div>
                <svg xmlns="http://www.w3.org/2000/svg" class="w-full" width="216" height="242" viewBox="0 0 216 242" fill="none">
                <path d="M45.0212 189.128C-22.9799 303.615 -23.5419 54.1399 -5.03888 -5.46223C13.4642 -65.0644 33.3341 15.3499 93.2 33.9348C202.951 10.9411 253.62 151.273 183.469 215.356C93.8824 318.429 101.575 79.4657 45.0212 189.128Z" fill="#89C2D9"/>
                <path d="M45.0212 189.128C-22.9799 303.615 -23.5419 54.1399 -5.03888 -5.46223C13.4642 -65.0644 33.3341 15.3499 93.2 33.9348C202.951 10.9411 253.62 151.273 183.469 215.356C93.8824 318.429 101.575 79.4657 45.0212 189.128Z" fill="url(#paint0_linear_33_4287)"/>
                <defs>
                    <linearGradient id="paint0_linear_33_4287" x1="-16.6889" y1="111.335" x2="180.845" y2="104.074" gradientUnits="userSpaceOnUse">
                    <stop stop-color="#267FA6" stop-opacity="0"/>
                    <stop offset="1" stop-color="#C2D6DF"/>
                    </linearGradient>
                </defs>
                </svg>
            </div>
            <div>
                <svg xmlns="http://www.w3.org/2000/svg"  class="w-full" width="191" height="251" viewBox="0 0 191 251" fill="none">
                <path d="M247.716 34.325C316.379 -79.7657 341.685 130.463 322.837 189.957C302.857 272.777 265.107 148.687 194.852 191.489C-44.2683 350.771 -21.5581 144.983 48.9631 81.3076C139.145 -21.2448 190.528 143.658 247.716 34.325Z" fill="#89C2D9"/>
                <path d="M247.716 34.325C316.379 -79.7657 341.685 130.463 322.837 189.957C302.857 272.777 265.107 148.687 194.852 191.489C-44.2683 350.771 -21.5581 144.983 48.9631 81.3076C139.145 -21.2448 190.528 143.658 247.716 34.325Z" fill="url(#paint0_linear_33_4292)"/>
                <defs>
                    <linearGradient id="paint0_linear_33_4292" x1="282.326" y1="106.587" x2="84.7528" y2="112.703" gradientUnits="userSpaceOnUse">
                    <stop stop-color="#267FA6" stop-opacity="0"/>
                    <stop offset="1" stop-color="#C2D6DF"/>
                    </linearGradient>
                </defs>
                </svg>
            </div>
        </div> -->

        <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
            <a href="/">
                <div class="flex justify-end">
                    X
                </div>
            </a> 
            <div class="flex flex-col items-center">
               
                <div class="w-40 p-2">
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

        <!-- <div class="flex justify-between items-baseline mt-[-15rem]" >
            <div>
                <svg xmlns="http://www.w3.org/2000/svg"  class="w-full" width="282" height="321" viewBox="0 0 282 321" fill="none">
                    <path d="M67.0001 415.5C73.8029 599.391 -127.174 382.728 -151.768 300.481C-193.772 191.024 -46.8289 300.554 5.84615 195.758C174.157 -176.261 311.958 74.0367 275.789 202.581C246.577 390.781 49.792 246.206 67.0001 415.5Z" fill="#89C2D9"/>
                    <path d="M67.0001 415.5C73.8029 599.391 -127.174 382.728 -151.768 300.481C-193.772 191.024 -46.8289 300.554 5.84615 195.758C174.157 -176.261 311.958 74.0367 275.789 202.581C246.577 390.781 49.792 246.206 67.0001 415.5Z" fill="url(#paint0_linear_33_4293)"/>
                    <defs>
                        <linearGradient id="paint0_linear_33_4293" x1="55.0228" y1="292.016" x2="286.491" y2="114.616" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#267FA6" stop-opacity="0"/>
                        <stop offset="1" stop-color="#C2D6DF"/>
                        </linearGradient>
                    </defs>
                </svg>
            </div>
            <div>
                <svg xmlns="http://www.w3.org/2000/svg" class="w-full" width="113" height="116" viewBox="0 0 113 116" fill="none">
                    <path d="M91.9396 33.474C82.5035 -44.0381 183.427 34.0387 197.678 67.2266C220.959 110.758 148.836 74.401 127.894 122.456C62.2449 291.767 -10.4228 195.09 2.02723 138.098C9.20599 56.2859 105.721 104.081 91.9396 33.474Z" fill="#89C2D9"/>
                    <path d="M91.9396 33.474C82.5035 -44.0381 183.427 34.0387 197.678 67.2266C220.959 110.758 148.836 74.401 127.894 122.456C62.2449 291.767 -10.4228 195.09 2.02723 138.098C9.20599 56.2859 105.721 104.081 91.9396 33.474Z" fill="url(#paint0_linear_33_4294)"/>
                    <defs>
                        <linearGradient id="paint0_linear_33_4294" x1="140.887" y1="49.2608" x2="47.128" y2="147.907" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#267FA6" stop-opacity="0"/>
                        <stop offset="1" stop-color="#C2D6DF"/>
                        </linearGradient>
                    </defs>
                </svg>
            </div>
        </div> -->
    </div>
    
    </div>
</template>

<script>

</script>

<style scoped>

</style>