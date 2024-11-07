-- DropForeignKey
ALTER TABLE "Business" DROP CONSTRAINT "Business_business_admin_profile_id_fkey";

-- DropForeignKey
ALTER TABLE "Business" DROP CONSTRAINT "Business_status_id_fkey";

-- DropForeignKey
ALTER TABLE "BusinessBranch" DROP CONSTRAINT "BusinessBranch_branch_created_by_fkey";

-- DropForeignKey
ALTER TABLE "BusinessChange" DROP CONSTRAINT "BusinessChange_change_status_id_fkey";

-- DropForeignKey
ALTER TABLE "BusinessStatusLog" DROP CONSTRAINT "BusinessStatusLog_status_id_fkey";

-- DropForeignKey
ALTER TABLE "BusinessStatusLog" DROP CONSTRAINT "BusinessStatusLog_user_id_fkey";

-- DropForeignKey
ALTER TABLE "Coupon" DROP CONSTRAINT "Coupon_status_id_fkey";

-- AddForeignKey
ALTER TABLE "Business" ADD CONSTRAINT "Business_status_id_fkey" FOREIGN KEY ("status_id") REFERENCES "BusinessStatus"("status_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Business" ADD CONSTRAINT "Business_business_admin_profile_id_fkey" FOREIGN KEY ("business_admin_profile_id") REFERENCES "Profile"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BusinessBranch" ADD CONSTRAINT "BusinessBranch_branch_created_by_fkey" FOREIGN KEY ("branch_created_by") REFERENCES "Profile"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BusinessChange" ADD CONSTRAINT "BusinessChange_change_status_id_fkey" FOREIGN KEY ("change_status_id") REFERENCES "BusinessChangeStatus"("business_change_status_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BusinessStatusLog" ADD CONSTRAINT "BusinessStatusLog_status_id_fkey" FOREIGN KEY ("status_id") REFERENCES "BusinessStatus"("status_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BusinessStatusLog" ADD CONSTRAINT "BusinessStatusLog_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Profile"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Coupon" ADD CONSTRAINT "Coupon_status_id_fkey" FOREIGN KEY ("status_id") REFERENCES "CouponStatus"("status_id") ON DELETE SET NULL ON UPDATE CASCADE;
