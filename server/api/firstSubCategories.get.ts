// api/firstSubCategories.ts
import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

export default defineEventHandler(async (event) => {
  return await prisma.categories.findMany({
    include: {
      subCategories: {
        orderBy: {
          id: 'asc'
        },
        take: 1 // Neem alleen de eerste subcategorie
      }
    }
  });


});
