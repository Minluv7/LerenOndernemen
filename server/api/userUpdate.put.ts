import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
  if (event.node.req.method === 'PUT') {
    const body = await readBody(event);
    console.log('Received body:', body); // Debug logging

    const { id, email, userName, firstName, lastName } = body;

    if (!id || !email || !userName || !firstName || !lastName) {
      console.error('Missing required fields');
      throw createError({ statusCode: 400, statusMessage: 'Missing id, email, userName, firstName, or lastName' });
    }

    try {
      const updatedUser = await prisma.users.update({
        where: { id: Number(id) },
        data: { email, userName, firstName, lastName },
      });
      console.log('Updated user:', updatedUser); // Debug logging

      return { success: true, data: updatedUser };
    } catch (error) {
      console.error('Error updating user:', error);
      return { success: false, error: error };
    }
  } else {
    return { success: false, error: 'Invalid request method' };
  }
});
