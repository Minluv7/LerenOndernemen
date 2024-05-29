// api/categories/[id].ts
import { PrismaClient } from '@prisma/client'
import { getServerSession } from '#auth';
const prisma = new PrismaClient()

export default defineEventHandler(async (event) => {
  const id = event.context.params?.id;
  const session = await getServerSession(event);

  console.log(id, "id")
  if (!id) {
    throw createError({ statusCode: 400, statusMessage: 'ID is required' });
  }

  const category = await prisma.categories.findUnique({
    where: { id: parseInt(id) },
    include: {
      subCategories: true
    }
  });

  if (!category) {
    throw createError({ statusCode: 404, statusMessage: 'Category not found' });
  }

  const viewedLessons = await prisma.viewedLessens.findMany({
    //@ts-expect-error
    where: { userId: session?.user?.id },
    select: { subCategoryId: true }
  });

  const viewedSubCategoryIds = viewedLessons.map(lesson => lesson.subCategoryId);

  const enhancedSubCategories = category.subCategories.map(subCategory => ({
    ...subCategory,
    viewed: viewedSubCategoryIds.includes(subCategory.id)
  }));

  return {
    ...category,
    subCategories: enhancedSubCategories
  };

});
