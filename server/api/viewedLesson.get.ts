import { PrismaClient } from '@prisma/client'
import { getServerSession } from '#auth';
const prisma = new PrismaClient()

export default defineEventHandler(async (event) => {
  const session = await getServerSession(event);
  console.log('userId', session);
  return await prisma.viewedLessens.findMany({
    where: {
       //@ts-expect-error
      userId: session?.user?.id
    },
    select: {
      subCategory: true,
    },
  });
  
});


