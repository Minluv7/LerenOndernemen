-- CreateTable
CREATE TABLE "MotivationDay" (
    "id" SERIAL NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "motivation" TEXT NOT NULL,

    CONSTRAINT "MotivationDay_pkey" PRIMARY KEY ("id")
);
