-- CreateTable
CREATE TABLE "DetailQuestionnaire" (
    "id" SERIAL NOT NULL,
    "question" TEXT NOT NULL,
    "answer" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "subCategoryId" INTEGER NOT NULL,

    CONSTRAINT "DetailQuestionnaire_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "DetailQuestionnaire" ADD CONSTRAINT "DetailQuestionnaire_subCategoryId_fkey" FOREIGN KEY ("subCategoryId") REFERENCES "SubCategories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
