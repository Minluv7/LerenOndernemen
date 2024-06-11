import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();
import { getServerSession } from '#auth';

export default defineEventHandler(async (event) => {
  const session = await getServerSession(event);

  // Controleer of de sessie een geldige gebruiker heeft
  //@ts-expect-error
  if (!session?.user?.id) {
    console.log('Geen geldige sessie gevonden');
    return { error: 'Geen geldige sessie gevonden' };
  }
  // @ts-expect-error
  console.log('Sessie gevonden:', session.user?.id);

  try {

    await prisma.businessPlanValue.deleteMany({
      where: {
        //@ts-expect-error
        user_id: session.user.id,
      },
    });

    const deletedUser = await prisma.users.delete({
      where: {
        //@ts-expect-error
        id: session.user.id,
      },
    });

    console.log('Gebruiker succesvol verwijderd:', deletedUser);
    return { message: 'Gebruiker succesvol verwijderd', deletedUser };
  } catch (error) {
    console.error('Fout bij het verwijderen van gebruiker:', error);
    return { error: 'Fout bij het verwijderen van gebruiker', details: error };
  } finally {
    await prisma.$disconnect();
  }
});
