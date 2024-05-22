-- CreateTable
CREATE TABLE "Types" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "subCategoryId" INTEGER NOT NULL,

    CONSTRAINT "Types_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Types" ADD CONSTRAINT "Types_subCategoryId_fkey" FOREIGN KEY ("subCategoryId") REFERENCES "SubCategories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
