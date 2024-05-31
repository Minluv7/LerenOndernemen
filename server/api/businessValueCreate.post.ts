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
    const newValue = await prisma.businessPlanValue.create({
      data: {
        value: value,
        businessPlanQuetionId: businessPlanQuetionId,
        // @ts-expect-error
        user_id: session.user.id
      }
    });
    return { success: true, data: newValue };
  }

  throw createError({ statusCode: 405, statusMessage: 'Method Not Allowed' });
});
