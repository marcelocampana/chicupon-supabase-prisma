-- DropForeignKey
ALTER TABLE "Business" DROP CONSTRAINT "Business_status_id_fkey";

-- AddForeignKey
ALTER TABLE "Business" ADD CONSTRAINT "Business_status_id_fkey" FOREIGN KEY ("status_id") REFERENCES "BusinessStatus"("status_id") ON DELETE RESTRICT ON UPDATE CASCADE;
