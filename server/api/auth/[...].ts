import {NuxtAuthHandler} from '#auth'
import CredentialsProvider from 'next-auth/providers/credentials'
import bcrypt from 'bcrypt'
import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

export default NuxtAuthHandler({
  secret: useRuntimeConfig().authSecret,
  pages: {
    signIn: '/login',

  },
  providers: [
    // @ts-expect-error
    CredentialsProvider.default({
      name: 'credentials',
      credentials: {},

      async authorize(credentials: { email: string, password: string }) {
        const user = await prisma.users.findUnique({ where: { email: credentials.email } });

      
        if (!user || !(await bcrypt.compare(credentials.password, user.password))) {
          return null; // Als de gebruiker niet wordt gevonden of het wachtwoord niet overeenkomt, retourneer null
        }
      
        return {
          ...user,
          password: undefined,
        };
      }
      
    }),
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
    },
  },
})