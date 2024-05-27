// https://nuxt.com/docs/api/configuration/nuxt-config
export default ({
  devtools: { enabled: true },

  runtimeConfig: {
    authSecret: process.env.AUTH_SECRET,
  },

  modules: ['@nuxtjs/tailwindcss', '@nuxtjs/cloudinary', "@sidebase/nuxt-auth"],
  auth: {
    baseUrl: process.env.AUTH_ORIGIN,
    provider: {
      type: 'authjs'
    },
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

  app: {
    head: {
      link: [
        { rel: 'apple-touch-icon', sizes: '144x144', href: '/apple-touch-icon.png' },
        { rel: 'icon', type: 'image/png', sizes: '32x32', href: '/favicon-32x32.png' },
        { rel: 'icon', type: 'image/png', sizes: '16x16', href: '/favicon-16x16.png' },
        { rel: 'manifest', href: '/site.webmanifest' },
        { rel: 'mask-icon', href: '/safari-pinned-tab.svg', color: '#3f6da3' }
      ],
      meta: [
        { name: 'msapplication-TileColor', content: '#f0f5f9' },
        { name: 'theme-color', content: '#ffffff' }
      ]
    }
  },
    head: {
      link: [
        { rel: 'stylesheet', href: "https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&display=swap" },
      ],
  }
  
});