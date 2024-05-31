// api/businessPlan/[id].ts
import { PrismaClient } from '@prisma/client'
import { getServerSession } from "#auth";
const prisma = new PrismaClient()

export default defineEventHandler(async (event) => {
  const id = event.context.params?.id;
  const session = await getServerSession(event);

  console.log(id, "id")
  if (!id) {
    throw createError({ statusCode: 400, statusMessage: 'ID is required' });
  }

  if (!session || !session.user) {
    throw createError({ statusCode: 401, statusMessage: 'Unauthorized' });
  }

  return await prisma.businessPlan.findUnique({
    where: { id: parseInt(id) },
    include: {
      businessPlanQuetion: {
        include: {
          businessPlanValue: {
            where: {
              // @ts-expect-error
              user_id: session.user.id
            }
          }
        }
      }
    }
  });

});
