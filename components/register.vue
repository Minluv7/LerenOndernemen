<template>
    <div class="flex flex-col items-center justify-center px-6 pt-8 mx-auto h-screen lg:py-0">
    
    <div class=" w-full bg-white rounded-lg shadow-md md:mt-0 sm:max-w-md xl:p-0">
        <!-- <div class="flex justify-between mb-[-24rem]" >
            <div>
                <svg xmlns="http://www.w3.org/2000/svg" class="w-full" height="183" viewBox="0 0 144 183" fill="none">
                    <path d="M52.41 149.656C61.8461 227.168 -39.0777 149.091 -53.3283 115.903C-76.6093 72.3722 -4.48617 108.729 16.456 60.6734C82.1047 -108.637 154.772 -11.9603 142.322 45.0322C135.144 126.844 38.6289 79.0487 52.41 149.656Z" fill="#89C2D9"/>
                    <path d="M52.41 149.656C61.8461 227.168 -39.0777 149.091 -53.3283 115.903C-76.6093 72.3722 -4.48617 108.729 16.456 60.6734C82.1047 -108.637 154.772 -11.9603 142.322 45.0322C135.144 126.844 38.6289 79.0487 52.41 149.656Z" fill="url(#paint0_linear_33_4297)"/>
                    <defs>
                        <linearGradient id="paint0_linear_33_4297" x1="3.46292" y1="133.869" x2="97.2216" y2="35.2228" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#267FA6" stop-opacity="0"/>
                        <stop offset="1" stop-color="#C2D6DF"/>
                        </linearGradient>
                    </defs>
                </svg>
            </div>
            <div>
                <svg xmlns="http://www.w3.org/2000/svg" class="w-full" height="397" viewBox="0 0 289 397" fill="none">
                    <path d="M155.268 38.2308C128.309 -111.685 324.951 36.852 355.423 100.765C403.9 184.472 265.748 115.984 232.79 209.653C131.753 539.448 -14.7742 354.111 1.34886 243.358C4.66873 84.6626 189.439 174.652 155.268 38.2308Z" fill="#89C2D9"/>
                    <path d="M155.268 38.2308C128.309 -111.685 324.951 36.852 355.423 100.765C403.9 184.472 265.748 115.984 232.79 209.653C131.753 539.448 -14.7742 354.111 1.34886 243.358C4.66873 84.6626 189.439 174.652 155.268 38.2308Z" fill="url(#paint0_linear_33_4298)"/>
                    <defs>
                        <linearGradient id="paint0_linear_33_4298" x1="247.941" y1="67.493" x2="77.195" y2="252.886" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#267FA6" stop-opacity="0"/>
                        <stop offset="1" stop-color="#C2D6DF"/>
                        </linearGradient>
                    </defs>
                </svg>
            </div>
        </div> -->

        <div class=" space-y-4 md:space-y-6 sm:p-8 ">
            <a href="/">
         
              <div class="flex justify-end">
                    X
                </div>
         
            </a>
            <div class="flex flex-col items-center">

                <div class=" w-40">
                    <img  src="/assets/image/logos/logo@2x.png" alt="logo">
                </div>
                <p class="text-xl font-bold text-gray-900 md:text-xl">
                        Registreer je nu om toegang te krijgen
                </p>
            </div>
            <registerForm />
            <p class="text-sm flex flex-col font-light" >
                Heb je al een account?
                <a
                    href="/login"
                    class="font-medium text-primary-600 hover:underline"
                    >Login
                </a>
            </p>
        </div>

        <!-- <div class="flex justify-between items-baseline mt-[-8rem]" >
            <div>
                <svg xmlns="http://www.w3.org/2000/svg" class="w-full" height="192" viewBox="0 0 222 192" fill="none">
                    <path d="M-25.3667 216.805C-94.0299 330.896 -119.335 120.667 -100.487 61.1733C-80.5072 -21.6468 -42.7577 102.443 27.4979 59.6412C266.618 -99.6408 243.908 106.147 173.386 169.822C83.2044 272.375 31.8213 107.472 -25.3667 216.805Z" fill="#89C2D9"/>
                    <path d="M-25.3667 216.805C-94.0299 330.896 -119.335 120.667 -100.487 61.1733C-80.5072 -21.6468 -42.7577 102.443 27.4979 59.6412C266.618 -99.6408 243.908 106.147 173.386 169.822C83.2044 272.375 31.8213 107.472 -25.3667 216.805Z" fill="url(#paint0_linear_33_4299)"/>
                    <defs>
                        <linearGradient id="paint0_linear_33_4299" x1="-59.9761" y1="144.543" x2="137.597" y2="138.427" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#267FA6" stop-opacity="0"/>
                        <stop offset="1" stop-color="#C2D6DF"/>
                        </linearGradient>
                    </defs>
                </svg>
            </div>
            <div>
                <svg xmlns="http://www.w3.org/2000/svg" class="w-full" height="175" viewBox="0 0 185 175" fill="none">
                    <path d="M171.328 53.0014C239.33 -61.4851 239.892 187.99 221.388 247.592C202.885 307.194 183.016 226.78 123.15 208.195C13.3989 231.189 -37.2704 90.8565 32.8807 26.7739C122.467 -76.299 114.775 162.664 171.328 53.0014Z" fill="#89C2D9"/>
                    <path d="M171.328 53.0014C239.33 -61.4851 239.892 187.99 221.388 247.592C202.885 307.194 183.016 226.78 123.15 208.195C13.3989 231.189 -37.2704 90.8565 32.8807 26.7739C122.467 -76.299 114.775 162.664 171.328 53.0014Z" fill="url(#paint0_linear_33_4300)"/>
                    <defs>
                        <linearGradient id="paint0_linear_33_4300" x1="233.039" y1="130.795" x2="35.5043" y2="138.056" gradientUnits="userSpaceOnUse">
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