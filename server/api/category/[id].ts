// api/categories/[id].ts
import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

export default defineEventHandler(async (event) => {
  const id = event.context.params?.id;
  console.log(id, "id")
  if (!id) {
    throw createError({ statusCode: 400, statusMessage: 'ID is required' });
  }

  return await prisma.categories.findUnique({
    where: { id: parseInt(id) },
    include: {
      subCategories: true
    }
  });
});
