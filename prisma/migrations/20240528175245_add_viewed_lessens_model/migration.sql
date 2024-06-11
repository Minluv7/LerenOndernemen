
-- DropForeignKey
ALTER TABLE "ViewedLessens" DROP CONSTRAINT "ViewedLessens_userId_fkey";

-- CreateTable
CREATE TABLE "ViewedLessens" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "subCategoryId" INTEGER NOT NULL,

    CONSTRAINT "ViewedLessens_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "ViewedLessens" ADD CONSTRAINT "ViewedLessens_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ViewedLessens" ADD CONSTRAINT "ViewedLessens_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ViewedLessens" ADD CONSTRAINT "ViewedLessens_subCategoryId_fkey" FOREIGN KEY ("subCategoryId") REFERENCES "SubCategories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
