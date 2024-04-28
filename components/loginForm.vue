<template>
  <form class="space-y-4 md:space-y-6" action="#">
    <div>
      <label
        for="email"
        class="block mb-2 text-sm font-medium text-gray-900"
        >E-mail</label
      >
      <input
        type="email"
        name="email"
        id="email"
        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 "
        placeholder="naam@hotmail.com"
        required=""
      />
    </div>
    <div>
      <label
        for="password"
        class="block mb-2 text-sm font-medium text-gray-900 "
        >Wachtwoord</label
      >
      <input
        type="password"
        name="password"
        id="password"
        placeholder="••••••••"
        class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 "
        required=""
      />
    </div>
    <div class="flex items-center justify-between">
      <a
        href="#"
        class="text-sm font-medium text-primary-600 hover:underline dark:text-primary-500"
        >Wachtwoord vergeten?</a
      >
    </div>
    <button
      type="submit"
     class="text-center"
    >
      Login
    </button>
    <p class="text-sm flex flex-col font-light text-gray-50" >
      Heb je nog geen account?
      <a
        href="#"
        class="font-medium text-primary-600 hover:underline"
        >Registreer</a
      >
    </p>
  </form>
</template>