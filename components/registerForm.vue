<template>
  <form class="space-y-4 md:space-y-6" action="#">
    <div>
        <label
            for="userName"
            class="block mb-2 text-sm font-medium text-gray-900"
            >Gebruikersnaam</label
        >
        <input
            type="text"
            name="userName"
            id="userName"
            class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 "
            placeholder="gebruikersnaam"
            required=""
        />
    </div>
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
    <button
      type="submit"
     class="text-center"
    >
      Registreer
    </button>
    <p class="text-sm flex flex-col font-light text-gray-50" >
      Heb je al een account?
      <a
        href="/login"
        class="font-medium text-primary-600 hover:underline"
        >Login</a
      >
    </p>
  </form>
</template>