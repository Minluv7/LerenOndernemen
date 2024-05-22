// api/firstSubCategories.ts
import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

export default defineEventHandler(async (event) => {

  const slug = event.context.params?.slug;
  if (!slug) {
    throw createError({ statusCode: 400, statusMessage: 'ID is required' });
  }
  console.log(event.context.params?.slug, "params")
  const subCategories = await prisma.subCategories.findMany({
    where: {
      slug: slug // Filter op de slug die overeenkomt met de route
    },
    orderBy: {
      id: 'asc'
    }
  });

  console.log('Filtered subcategories:', subCategories); // Controleer de gefilterde subcategorieën

  return subCategories;
})