// server/api/deleteUser.ts
import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();
import { getServerSession } from '#auth';

export default defineEventHandler(async (event) => {
  const session = await getServerSession(event);

  // Controleer of de sessie een geldige gebruiker heeft
  //@ts-expect-error
  if (!session?.user?.id) {
    return { error: 'Geen geldige sessie gevonden' };
  }

  // Verwijder de gebruiker uit de database
  try {
    const deletedUser = await prisma.users.delete({
      where: {
        //@ts-expect-error
        id: session.user.id,
      },
    });
    return { message: 'Gebruiker succesvol verwijderd', deletedUser };
  } catch (error) {
    return { error: 'Fout bij het verwijderen van gebruiker', details: error };
  }
});
