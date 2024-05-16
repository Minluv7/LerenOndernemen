import bcrypt from 'bcrypt';
import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

export default defineEventHandler(async (event) => {

    const body = await readBody(event);

    if(!body.email || !body.password || !body.userName) {

        throw createError({
            statusCode: 400,
            statusMessage: 'Bad Request',
            message: 'Missing required fields'
        })
    }

    // Check if user already exists
    const existingUser = await prisma.users.findUnique({
        where: {
            email: body.email
        }
    });

    if (existingUser) {
        throw createError({
            statusCode: 400,
            statusMessage: 'Bad Request',
            message: 'User already exists'
        });
    }

    // Hash the password
    const hashedPassword = await bcrypt.hash(body.password, 10);

    // Create the new user
    const user = await prisma.users.create({
        data: {
            userName: body.userName,
            email: body.email,
            password: hashedPassword
        }
    });

    return user;
});