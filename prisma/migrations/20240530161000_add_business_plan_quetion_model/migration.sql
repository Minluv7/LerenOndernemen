-- CreateTable
CREATE TABLE "BusinessPlanQuetion" (
    "id" SERIAL NOT NULL,
    "question" TEXT NOT NULL,
    "businessPlanId" INTEGER NOT NULL,

    CONSTRAINT "BusinessPlanQuetion_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "BusinessPlanQuetion" ADD CONSTRAINT "BusinessPlanQuetion_businessPlanId_fkey" FOREIGN KEY ("businessPlanId") REFERENCES "BusinessPlan"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
