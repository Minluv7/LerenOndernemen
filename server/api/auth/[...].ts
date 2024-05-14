import {NuxtAuthHandler} from '#auth'
import CredentialProvider from 'next-auth/providers/credentials'

export default NuxtAuthHandler({
  secret: useRuntimeConfig().authSecret as string | undefined,
  pages: {
    signIn: '/login',
  },
  providers: [
    // @ts-expect-error
    CredentialProvider.default({
      name: 'credentials',
      credentials: {
        email: {label: 'email', type: 'text'},
        password: {label: 'Password', type: 'password'}
      },
      async authorize(credentials: { email: string, password: string }) {
      return{};
        
      }
    })
  ],
  session: {
    strategy: 'jwt',
  },
  callbacks: {
    async jwt({token, user}) {
      if (user) {
        token = {
          ...token,
          ...user
        }
      }
      return token;
    },
    async session({session, token}) {
      session.user = {
        ...token,
        ...session.user,
    };
      return session;
    }
  }
})