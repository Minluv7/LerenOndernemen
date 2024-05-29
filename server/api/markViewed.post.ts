// api/addViewedLesson.js
import { defineEventHandler, readBody } from 'h3'
import { PrismaClient } from '@prisma/client'
import { getServerSession } from "#auth";
const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
  // Haal de sessie op
  const session = await getServerSession(event);
  if (!session || !session.user) {
    return {
      statusCode: 401,
      message: 'Unauthorized',
    };
  }

  // Haal de body van het verzoek op
  const body = await readBody(event);
  const { subCategoryId } = body;

  if (!subCategoryId) {
    return {
      statusCode: 400,
      message: 'subCategoryId is required',
    };
  }

  try {
    // Maak een nieuwe ViewedLesson aan
    const viewedLesson = await prisma.viewedLessens.create({
      data: {
        // @ts-expect-error
        userId: session.user.id,
        subCategoryId: parseInt(subCategoryId),
      },
    });
    return {
      statusCode: 200,
      message: 'Viewed lesson added successfully',
      viewedLesson,
    };
  } catch (error) {
    console.error(error);
    return {
      statusCode: 500,
      message: 'Internal Server Error',
    };
  }
});
