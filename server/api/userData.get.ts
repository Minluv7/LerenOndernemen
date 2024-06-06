import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();
import { getServerSession } from '#auth';

export default defineEventHandler(async (event) => {
  const session = await getServerSession(event);
 //@ts-expect-error
  if (! session?.user?.id) {
    return { error: 'Geen geldige sessie gevonden' };
  }

  return await prisma.users.findUnique({
    where: {
       //@ts-expect-error
      id: session.user.id
    }
  });
});
