-- CreateTable
CREATE TABLE "Categories" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "image" TEXT NOT NULL,

    CONSTRAINT "Categories_pkey" PRIMARY KEY ("id")
);
