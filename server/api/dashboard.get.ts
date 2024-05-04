import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

export default defineEventHandler(async (event) => {
  return await prisma.dashboard.findMany({
    orderBy: {
      id: 'asc' // 'asc' voor oplopende volgorde, 'desc' voor aflopende volgorde
    }
  });
});