// api/firstSubCategories.ts
import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

export default defineEventHandler(async (event) => {
  const slug = event.context.params?.slug;
 
  console.log(event.context.params?.slug, "params")
  return await prisma.subCategories.findMany({
    where: {
      slug: slug // Filter op de slug die overeenkomt met de route
    },
      
        });
})