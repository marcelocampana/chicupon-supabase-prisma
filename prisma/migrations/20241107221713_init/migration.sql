/*
  Warnings:

  - You are about to drop the `Post` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Post" DROP CONSTRAINT "Post_authorId_fkey";

-- DropTable
DROP TABLE "Post";

-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "Business" (
    "business_id" TEXT NOT NULL,
    "business_legal_name" TEXT NOT NULL,
    "business_rut" TEXT NOT NULL,
    "business_display_name" TEXT NOT NULL,
    "business_email" TEXT NOT NULL,
    "business_main_phone" TEXT,
    "business_secondary_phone" TEXT,
    "business_description" TEXT,
    "legal_representative_firstname" TEXT NOT NULL,
    "legal_representative_lastname" TEXT NOT NULL,
    "legal_representative_rut" TEXT NOT NULL,
    "business_admin_profile_id" TEXT NOT NULL,
    "business_website" TEXT,
    "business_facebook" TEXT,
    "business_instagram" TEXT,
    "business_whatsapp" TEXT,
    "business_logo" TEXT,
    "business_cover" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "subscription_id" INTEGER,
    "status_id" INTEGER NOT NULL,
    "business_tiktok" TEXT,
    "is_featured" BOOLEAN NOT NULL DEFAULT false,
    "business_youtube" TEXT,
    "business_x" TEXT,

    CONSTRAINT "Business_pkey" PRIMARY KEY ("business_id")
);

-- CreateTable
CREATE TABLE "BusinessBranch" (
    "branch_id" TEXT NOT NULL,
    "branch_address" TEXT NOT NULL,
    "branch_commune" TEXT NOT NULL,
    "branch_city" TEXT NOT NULL,
    "branch_phone" TEXT,
    "branch_latitude" DOUBLE PRECISION,
    "branch_longitude" DOUBLE PRECISION,
    "branch_address_type" TEXT NOT NULL,
    "branch_created_by" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "business_id" TEXT,

    CONSTRAINT "BusinessBranch_pkey" PRIMARY KEY ("branch_id")
);

-- CreateTable
CREATE TABLE "BusinessChangeComment" (
    "business_change_comment_id" TEXT NOT NULL,
    "business_change_id" TEXT NOT NULL,
    "comment" TEXT NOT NULL,
    "author_role" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "BusinessChangeComment_pkey" PRIMARY KEY ("business_change_comment_id")
);

-- CreateTable
CREATE TABLE "BusinessChangeStatus" (
    "business_change_status_id" SERIAL NOT NULL,
    "status_name" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BusinessChangeStatus_pkey" PRIMARY KEY ("business_change_status_id")
);

-- CreateTable
CREATE TABLE "BusinessChange" (
    "business_change_id" TEXT NOT NULL,
    "business_id" TEXT NOT NULL,
    "business_legal_name" TEXT,
    "business_rut" TEXT,
    "business_display_name" TEXT,
    "business_description" TEXT,
    "legal_representative_firstname" TEXT,
    "legal_representative_lastname" TEXT,
    "legal_representative_rut" TEXT,
    "reviewer_id" TEXT,
    "change_status_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BusinessChange_pkey" PRIMARY KEY ("business_change_id")
);

-- CreateTable
CREATE TABLE "BusinessComment" (
    "business_comment_id" TEXT NOT NULL,
    "business_id" TEXT NOT NULL,
    "comment" TEXT NOT NULL,
    "author_role" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "BusinessComment_pkey" PRIMARY KEY ("business_comment_id")
);

-- CreateTable
CREATE TABLE "BusinessStatusLog" (
    "status_log_id" SERIAL NOT NULL,
    "status_id" INTEGER NOT NULL,
    "user_id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "BusinessStatusLog_pkey" PRIMARY KEY ("status_log_id")
);

-- CreateTable
CREATE TABLE "BusinessStatus" (
    "status_id" SERIAL NOT NULL,
    "status" TEXT NOT NULL,
    "description" TEXT,

    CONSTRAINT "BusinessStatus_pkey" PRIMARY KEY ("status_id")
);

-- CreateTable
CREATE TABLE "CouponApproveStatus" (
    "coupon_approve_status_id" SERIAL NOT NULL,
    "status" TEXT NOT NULL,
    "description" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CouponApproveStatus_pkey" PRIMARY KEY ("coupon_approve_status_id")
);

-- CreateTable
CREATE TABLE "CouponComment" (
    "coupon_comment_id" TEXT NOT NULL,
    "comment" TEXT NOT NULL,
    "author_role" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "coupon_id" TEXT,

    CONSTRAINT "CouponComment_pkey" PRIMARY KEY ("coupon_comment_id")
);

-- CreateTable
CREATE TABLE "CouponPublicationStatus" (
    "coupon_publication_status_id" SERIAL NOT NULL,
    "status" TEXT NOT NULL,
    "description" TEXT,

    CONSTRAINT "CouponPublicationStatus_pkey" PRIMARY KEY ("coupon_publication_status_id")
);

-- CreateTable
CREATE TABLE "CouponRedeem" (
    "coupon_redeem_id" TEXT NOT NULL,
    "redeem_count" INTEGER NOT NULL DEFAULT 0,
    "request_count" INTEGER NOT NULL DEFAULT 0,
    "redeem_code" TEXT NOT NULL,
    "coupon_id" TEXT,

    CONSTRAINT "CouponRedeem_pkey" PRIMARY KEY ("coupon_redeem_id")
);

-- CreateTable
CREATE TABLE "CouponStatus" (
    "status_id" SERIAL NOT NULL,
    "status" TEXT NOT NULL,
    "description" TEXT,

    CONSTRAINT "CouponStatus_pkey" PRIMARY KEY ("status_id")
);

-- CreateTable
CREATE TABLE "Coupon" (
    "coupon_id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "promo_type" TEXT,
    "discount_amount" INTEGER,
    "discount_percentage" INTEGER,
    "another_promo_type" TEXT,
    "coupon_code" TEXT,
    "conditions" TEXT,
    "featured_image" TEXT,
    "redemption_type" TEXT NOT NULL,
    "redemption_link" TEXT,
    "redemption_addresses" JSONB NOT NULL DEFAULT '[]',
    "max_redeems_per_promo" INTEGER NOT NULL DEFAULT 0,
    "max_redeems_per_user" INTEGER NOT NULL DEFAULT 1,
    "start_date" TIMESTAMP(3) NOT NULL,
    "end_date" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "business_id" TEXT NOT NULL,
    "status_id" INTEGER NOT NULL,
    "categories" INTEGER[],
    "is_featured" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Coupon_pkey" PRIMARY KEY ("coupon_id")
);

-- CreateTable
CREATE TABLE "Profile" (
    "id" TEXT NOT NULL,
    "firstname" TEXT,
    "lastname" TEXT,
    "email" TEXT,
    "role" TEXT,
    "birthday" TEXT,
    "gender" TEXT,
    "phone" TEXT,
    "terms" TEXT NOT NULL DEFAULT 'No',

    CONSTRAINT "Profile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Subscription" (
    "subscription_id" SERIAL NOT NULL,
    "start_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "end_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "total_cost" DOUBLE PRECISION NOT NULL,
    "tax" DOUBLE PRECISION,
    "discount" DOUBLE PRECISION,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "plan_id" INTEGER,

    CONSTRAINT "Subscription_pkey" PRIMARY KEY ("subscription_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Business_business_rut_key" ON "Business"("business_rut");

-- CreateIndex
CREATE UNIQUE INDEX "Business_business_email_key" ON "Business"("business_email");

-- CreateIndex
CREATE UNIQUE INDEX "Business_business_admin_profile_id_key" ON "Business"("business_admin_profile_id");

-- CreateIndex
CREATE INDEX "Business_subscription_id_idx" ON "Business"("subscription_id");

-- CreateIndex
CREATE INDEX "Business_status_id_idx" ON "Business"("status_id");

-- CreateIndex
CREATE INDEX "Business_business_admin_profile_id_idx" ON "Business"("business_admin_profile_id");

-- CreateIndex
CREATE INDEX "BusinessBranch_branch_created_by_idx" ON "BusinessBranch"("branch_created_by");

-- CreateIndex
CREATE INDEX "BusinessBranch_business_id_idx" ON "BusinessBranch"("business_id");

-- CreateIndex
CREATE INDEX "BusinessChangeComment_business_change_id_idx" ON "BusinessChangeComment"("business_change_id");

-- CreateIndex
CREATE UNIQUE INDEX "BusinessChange_business_id_key" ON "BusinessChange"("business_id");

-- CreateIndex
CREATE UNIQUE INDEX "BusinessChange_business_rut_key" ON "BusinessChange"("business_rut");

-- CreateIndex
CREATE INDEX "BusinessChange_change_status_id_idx" ON "BusinessChange"("change_status_id");

-- CreateIndex
CREATE INDEX "BusinessChange_business_id_idx" ON "BusinessChange"("business_id");

-- CreateIndex
CREATE INDEX "BusinessChange_business_rut_idx" ON "BusinessChange"("business_rut");

-- CreateIndex
CREATE INDEX "BusinessComment_business_id_idx" ON "BusinessComment"("business_id");

-- CreateIndex
CREATE INDEX "BusinessStatusLog_status_id_idx" ON "BusinessStatusLog"("status_id");

-- CreateIndex
CREATE INDEX "BusinessStatusLog_user_id_idx" ON "BusinessStatusLog"("user_id");

-- CreateIndex
CREATE INDEX "CouponComment_coupon_id_idx" ON "CouponComment"("coupon_id");

-- CreateIndex
CREATE UNIQUE INDEX "CouponRedeem_redeem_code_key" ON "CouponRedeem"("redeem_code");

-- CreateIndex
CREATE INDEX "CouponRedeem_coupon_id_idx" ON "CouponRedeem"("coupon_id");

-- CreateIndex
CREATE INDEX "Coupon_business_id_idx" ON "Coupon"("business_id");

-- CreateIndex
CREATE INDEX "Coupon_status_id_idx" ON "Coupon"("status_id");

-- AddForeignKey
ALTER TABLE "Business" ADD CONSTRAINT "Business_subscription_id_fkey" FOREIGN KEY ("subscription_id") REFERENCES "Subscription"("subscription_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Business" ADD CONSTRAINT "Business_status_id_fkey" FOREIGN KEY ("status_id") REFERENCES "BusinessStatus"("status_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Business" ADD CONSTRAINT "Business_business_admin_profile_id_fkey" FOREIGN KEY ("business_admin_profile_id") REFERENCES "Profile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BusinessBranch" ADD CONSTRAINT "BusinessBranch_branch_created_by_fkey" FOREIGN KEY ("branch_created_by") REFERENCES "Profile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BusinessBranch" ADD CONSTRAINT "BusinessBranch_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "Business"("business_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BusinessChangeComment" ADD CONSTRAINT "BusinessChangeComment_business_change_id_fkey" FOREIGN KEY ("business_change_id") REFERENCES "BusinessChange"("business_change_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BusinessChange" ADD CONSTRAINT "BusinessChange_change_status_id_fkey" FOREIGN KEY ("change_status_id") REFERENCES "BusinessChangeStatus"("business_change_status_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BusinessChange" ADD CONSTRAINT "BusinessChange_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "Business"("business_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BusinessComment" ADD CONSTRAINT "BusinessComment_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "Business"("business_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BusinessStatusLog" ADD CONSTRAINT "BusinessStatusLog_status_id_fkey" FOREIGN KEY ("status_id") REFERENCES "BusinessStatus"("status_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BusinessStatusLog" ADD CONSTRAINT "BusinessStatusLog_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Profile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CouponComment" ADD CONSTRAINT "CouponComment_coupon_id_fkey" FOREIGN KEY ("coupon_id") REFERENCES "Coupon"("coupon_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CouponRedeem" ADD CONSTRAINT "CouponRedeem_coupon_id_fkey" FOREIGN KEY ("coupon_id") REFERENCES "Coupon"("coupon_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Coupon" ADD CONSTRAINT "Coupon_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "Business"("business_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Coupon" ADD CONSTRAINT "Coupon_status_id_fkey" FOREIGN KEY ("status_id") REFERENCES "CouponStatus"("status_id") ON DELETE RESTRICT ON UPDATE CASCADE;
