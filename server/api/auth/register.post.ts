import bcrypt from 'bcrypt';
import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

export default defineEventHandler(async (event) => {

    const body = await readBody(event);

    if(!body.email || !body.password || !body.userName || !body.firstName || !body.lastName) {

        throw createError({
            statusCode: 400,
            statusMessage: 'Bad Request',
            message: 'Missing required fields'
        })
    }

     // Check if email already exists
     const existingEmail = await prisma.users.findUnique({
        where: {
            email: body.email.toLowerCase(), // Normalize email to lowercase
        }
    });

    if (existingEmail) {
        throw createError({
            statusCode: 400,
            statusMessage: 'Bad Request',
            message: 'Deze email bestaat al'
        });
    }

    // Check if username already exists
    const existingUsername = await prisma.users.findUnique({
        where: {
            userName: body.userName,
        }
    });

    if (existingUsername) {
        throw createError({
            statusCode: 400,
            statusMessage: 'Bad Request',
            message: 'Deze gebruikersnaam bestaat al'
        });
    }

    // Hash the password
    const hashedPassword = await bcrypt.hash(body.password, 10);

    // Create the new user
    const user = await prisma.users.create({
        data: {
            userName: body.userName,
            email: body.email.toLowerCase(),
            password: hashedPassword,
            firstName: body.firstName,
            lastName: body.lastName
        }
    });

    return user;
});