import { PrismaClient } from '@prisma/client';
import { getServerSession } from "#auth";

const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
  if (event.node.req.method === 'POST') {
    const body = await readBody(event);
    console.log('Request body:', body);
    const { businessPlanQuetionId, value } = body;

    if (!businessPlanQuetionId || !value) {
      throw createError({ statusCode: 400, statusMessage: 'Bad Request: Missing businessPlanQuetionId or value' });
    }

    const session = await getServerSession(event);
    if (!session || !session.user) {
      return {
        statusCode: 401,
        message: 'Unauthorized',
      };
    }

    try {
      // Controleer of er al een waarde bestaat voor deze vraag
      const existingValue = await prisma.businessPlanValue.findFirst({
        where: {
          businessPlanQuetionId: businessPlanQuetionId,
          // @ts-expect-error
          user_id: session.user.id,
        },
      });

      if (existingValue) {
        return { success: false, message: 'Er bestaat al een waarde voor deze vraag' };
      }

      // Sla de nieuwe waarde op
      const newValue = await prisma.businessPlanValue.create({
        data: {
          value: value,
          businessPlanQuetionId: businessPlanQuetionId,
          // @ts-expect-error
          user_id: session.user.id,
        },
      });

      return { success: true, data: newValue };
    } catch (error) {
      console.error('Error creating value:', error);
      throw createError({ statusCode: 500, statusMessage: 'Internal Server Error' });
    } finally {
      await prisma.$disconnect();
    }
  }

  throw createError({ statusCode: 405, statusMessage: 'Method Not Allowed' });
});
