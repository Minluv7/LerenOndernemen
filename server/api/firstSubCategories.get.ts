// api/firstSubCategories.ts
import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

export default defineEventHandler(async (event) => {
  const categories = await prisma.categories.findMany({
    include: {
      subCategories: {
        orderBy: {
          id: 'asc'
        }
      }
    }
  });

  // Voor elke categorie, haal de eerste subcategorie eruit
  const categoriesWithFirstSubCategory = categories.map(category => {
    return {
      ...category,
      subCategories: category.subCategories.length > 0 ? [category.subCategories[0]] : []
    }
  });

  return categoriesWithFirstSubCategory;
});
