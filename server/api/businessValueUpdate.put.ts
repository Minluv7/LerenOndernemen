import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

export default defineEventHandler(async (event) => {
  if (event.node.req.method === 'PUT') {
    const body = await readBody(event) as { id: number, value: string };
    const { id, value } = body;

    if (!id || !value) {
        throw createError({ statusCode:400, statusMessage: 'Missing id or value' });
    }

    const updatedValue = await prisma.businessPlanValue.update({
      where: { id: Number(id) },
      data: { value: value },
    })

    return { success: true, data: updatedValue }
    }
})