-- CreateTable
CREATE TABLE "SubCategories" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "description" TEXT,
    "avatar" TEXT,
    "user_id" INTEGER,
    "category_id" INTEGER NOT NULL,

    CONSTRAINT "SubCategories_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "SubCategories_slug_key" ON "SubCategories"("slug");

-- AddForeignKey
ALTER TABLE "SubCategories" ADD CONSTRAINT "SubCategories_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SubCategories" ADD CONSTRAINT "SubCategories_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "Categories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
