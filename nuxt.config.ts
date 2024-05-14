// https://nuxt.com/docs/api/configuration/nuxt-config
export default ({
  devtools: { enabled: true },

  runtimeConfig: {
    authSecret: process.env.AUTH_SECRET,
  },
  modules:  ['@nuxtjs/tailwindcss', '@nuxtjs/cloudinary', "@sidebase/nuxt-auth"],
  auth: {
    baseUrl: process.env.AUTH_ORIGIN,
    provider: {
        type: 'authjs'
    },
},
router: {
  middleware: 'auth' // Hier definieer je de middleware 'auth' voor alle pagina's
},
  tailwindcss: {
    config: {
      theme: {
        extend: {
          fontFamily: {
            'lato': ['Lato', 'sans-serif'],
          },
        },
      },
    },
  },

  head: {
    link: [
      { rel: 'stylesheet', href: "https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&display=swap" },
    ],
  }
});