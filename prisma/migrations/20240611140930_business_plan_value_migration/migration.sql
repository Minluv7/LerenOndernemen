-- DropForeignKey
ALTER TABLE "BusinessPlanQuetion" DROP CONSTRAINT "BusinessPlanQuetion_businessPlanId_fkey";


-- CreateTable
CREATE TABLE "BusinessPlanValue" (
    "id" SERIAL NOT NULL,
    "value" TEXT NOT NULL,
    "businessPlanQuetionId" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,

    CONSTRAINT "BusinessPlanValue_pkey" PRIMARY KEY ("id")
);


-- AddForeignKey
ALTER TABLE "BusinessPlanQuetion" ADD CONSTRAINT "BusinessPlanQuetion_businessPlanId_fkey" FOREIGN KEY ("businessPlanId") REFERENCES "BusinessPlan"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BusinessPlanValue" ADD CONSTRAINT "BusinessPlanValue_businessPlanQuetionId_fkey" FOREIGN KEY ("businessPlanQuetionId") REFERENCES "BusinessPlanQuetion"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BusinessPlanValue" ADD CONSTRAINT "BusinessPlanValue_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
