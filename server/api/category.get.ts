/*
// server/api/category.get.ts
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

export default async function getCategoryById(id: number) {
  try {
    console.log(`Fetching category with ID: ${id}`);
    const category = await prisma.categories.findUnique({
      where: {
        id: Number(id), // Ensure id is a number
      },
      include: {
        subCategories: true,
      },
    });
    console.log(`Fetched category: `, category);
    return category;
  } catch (error) {
    console.error('Error fetching category:', error);
    throw new Error('Something went wrong');
  }
}
*/