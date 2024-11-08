-- CreateTable
CREATE TABLE "category" (
    "category_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "description" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "category_pkey" PRIMARY KEY ("category_id")
);

-- CreateTable
CREATE TABLE "business" (
    "business_id" TEXT NOT NULL,
    "business_legal_name" TEXT NOT NULL,
    "business_rut" TEXT NOT NULL,
    "business_display_name" TEXT NOT NULL,
    "business_email" TEXT NOT NULL,
    "business_main_phone" TEXT NOT NULL,
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

    CONSTRAINT "business_pkey" PRIMARY KEY ("business_id")
);

-- CreateTable
CREATE TABLE "business_branch" (
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
    "business_id" TEXT NOT NULL,

    CONSTRAINT "business_branch_pkey" PRIMARY KEY ("branch_id")
);

-- CreateTable
CREATE TABLE "business_change_comment" (
    "business_change_comment_id" TEXT NOT NULL,
    "business_change_id" TEXT NOT NULL,
    "comment" TEXT NOT NULL,
    "author_role" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "business_change_comment_pkey" PRIMARY KEY ("business_change_comment_id")
);

-- CreateTable
CREATE TABLE "business_change_status" (
    "business_change_status_id" SERIAL NOT NULL,
    "status_name" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "business_change_status_pkey" PRIMARY KEY ("business_change_status_id")
);

-- CreateTable
CREATE TABLE "business_change" (
    "business_change_id" TEXT NOT NULL,
    "business_id" TEXT NOT NULL,
    "business_legal_name" TEXT NOT NULL,
    "business_rut" TEXT NOT NULL,
    "business_display_name" TEXT NOT NULL,
    "business_description" TEXT,
    "legal_representative_firstname" TEXT,
    "legal_representative_lastname" TEXT,
    "legal_representative_rut" TEXT,
    "reviewer_id" TEXT,
    "change_status_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "business_change_pkey" PRIMARY KEY ("business_change_id")
);

-- CreateTable
CREATE TABLE "business_comment" (
    "business_comment_id" TEXT NOT NULL,
    "business_id" TEXT NOT NULL,
    "comment" TEXT NOT NULL,
    "author_role" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "business_comment_pkey" PRIMARY KEY ("business_comment_id")
);

-- CreateTable
CREATE TABLE "business_status_log" (
    "status_log_id" SERIAL NOT NULL,
    "status_id" INTEGER NOT NULL,
    "user_id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "business_status_log_pkey" PRIMARY KEY ("status_log_id")
);

-- CreateTable
CREATE TABLE "business_status" (
    "status_id" SERIAL NOT NULL,
    "status" TEXT NOT NULL,
    "description" TEXT,

    CONSTRAINT "business_status_pkey" PRIMARY KEY ("status_id")
);

-- CreateTable
CREATE TABLE "coupon_approve_status" (
    "coupon_approve_status_id" SERIAL NOT NULL,
    "status" TEXT NOT NULL,
    "description" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "coupon_approve_status_pkey" PRIMARY KEY ("coupon_approve_status_id")
);

-- CreateTable
CREATE TABLE "coupon_comment" (
    "coupon_comment_id" TEXT NOT NULL,
    "comment" TEXT NOT NULL,
    "author_role" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "coupon_id" TEXT NOT NULL,

    CONSTRAINT "coupon_comment_pkey" PRIMARY KEY ("coupon_comment_id")
);

-- CreateTable
CREATE TABLE "coupon_publication_status" (
    "coupon_publication_status_id" SERIAL NOT NULL,
    "status" TEXT NOT NULL,
    "description" TEXT,

    CONSTRAINT "coupon_publication_status_pkey" PRIMARY KEY ("coupon_publication_status_id")
);

-- CreateTable
CREATE TABLE "coupon_redeem" (
    "coupon_redeem_id" TEXT NOT NULL,
    "redeem_count" INTEGER NOT NULL DEFAULT 0,
    "request_count" INTEGER NOT NULL DEFAULT 0,
    "redeem_code" TEXT NOT NULL,
    "coupon_id" TEXT NOT NULL,

    CONSTRAINT "coupon_redeem_pkey" PRIMARY KEY ("coupon_redeem_id")
);

-- CreateTable
CREATE TABLE "coupon_status" (
    "status_id" SERIAL NOT NULL,
    "status" TEXT NOT NULL,
    "description" TEXT,

    CONSTRAINT "coupon_status_pkey" PRIMARY KEY ("status_id")
);

-- CreateTable
CREATE TABLE "coupon" (
    "coupon_id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "promo_type" TEXT NOT NULL,
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
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "business_id" TEXT NOT NULL,
    "status_id" INTEGER NOT NULL,
    "categories" INTEGER[],
    "is_featured" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "coupon_pkey" PRIMARY KEY ("coupon_id")
);

-- CreateTable
CREATE TABLE "profile" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "firstname" TEXT NOT NULL,
    "lastname" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "role" TEXT NOT NULL,
    "birthday" TEXT,
    "gender" TEXT,
    "phone" TEXT,
    "terms" TEXT NOT NULL DEFAULT 'No',
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "has_access_to_business" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "profile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "plan" (
    "plan_id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "cost" DOUBLE PRECISION NOT NULL,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "is_available_for_subscription" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "plan_pkey" PRIMARY KEY ("plan_id")
);

-- CreateTable
CREATE TABLE "subscription" (
    "subscription_id" SERIAL NOT NULL,
    "start_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "end_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "total_cost" DOUBLE PRECISION NOT NULL,
    "discount" DOUBLE PRECISION,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "plan_id" INTEGER NOT NULL,
    "business_id" TEXT NOT NULL,

    CONSTRAINT "subscription_pkey" PRIMARY KEY ("subscription_id")
);

-- CreateTable
CREATE TABLE "tax_iva" (
    "tax_id" INTEGER NOT NULL DEFAULT 1,
    "rate" DOUBLE PRECISION NOT NULL,
    "description" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "tax_iva_pkey" PRIMARY KEY ("tax_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "category_name_key" ON "category"("name");

-- CreateIndex
CREATE UNIQUE INDEX "category_slug_key" ON "category"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "business_business_rut_key" ON "business"("business_rut");

-- CreateIndex
CREATE UNIQUE INDEX "business_business_email_key" ON "business"("business_email");

-- CreateIndex
CREATE UNIQUE INDEX "business_business_admin_profile_id_key" ON "business"("business_admin_profile_id");

-- CreateIndex
CREATE UNIQUE INDEX "business_subscription_id_key" ON "business"("subscription_id");

-- CreateIndex
CREATE INDEX "business_subscription_id_idx" ON "business"("subscription_id");

-- CreateIndex
CREATE INDEX "business_status_id_idx" ON "business"("status_id");

-- CreateIndex
CREATE INDEX "business_business_admin_profile_id_idx" ON "business"("business_admin_profile_id");

-- CreateIndex
CREATE INDEX "business_branch_branch_created_by_idx" ON "business_branch"("branch_created_by");

-- CreateIndex
CREATE INDEX "business_branch_business_id_idx" ON "business_branch"("business_id");

-- CreateIndex
CREATE INDEX "business_change_comment_business_change_id_idx" ON "business_change_comment"("business_change_id");

-- CreateIndex
CREATE UNIQUE INDEX "business_change_business_id_key" ON "business_change"("business_id");

-- CreateIndex
CREATE UNIQUE INDEX "business_change_business_rut_key" ON "business_change"("business_rut");

-- CreateIndex
CREATE INDEX "business_change_change_status_id_idx" ON "business_change"("change_status_id");

-- CreateIndex
CREATE INDEX "business_change_business_id_idx" ON "business_change"("business_id");

-- CreateIndex
CREATE INDEX "business_change_business_rut_idx" ON "business_change"("business_rut");

-- CreateIndex
CREATE INDEX "business_comment_business_id_idx" ON "business_comment"("business_id");

-- CreateIndex
CREATE INDEX "business_status_log_status_id_idx" ON "business_status_log"("status_id");

-- CreateIndex
CREATE INDEX "business_status_log_user_id_idx" ON "business_status_log"("user_id");

-- CreateIndex
CREATE INDEX "coupon_comment_coupon_id_idx" ON "coupon_comment"("coupon_id");

-- CreateIndex
CREATE UNIQUE INDEX "coupon_redeem_redeem_code_key" ON "coupon_redeem"("redeem_code");

-- CreateIndex
CREATE INDEX "coupon_redeem_coupon_id_idx" ON "coupon_redeem"("coupon_id");

-- CreateIndex
CREATE INDEX "coupon_business_id_idx" ON "coupon"("business_id");

-- CreateIndex
CREATE INDEX "coupon_status_id_idx" ON "coupon"("status_id");

-- CreateIndex
CREATE UNIQUE INDEX "profile_userId_key" ON "profile"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "plan_name_key" ON "plan"("name");

-- CreateIndex
CREATE UNIQUE INDEX "tax_iva_tax_id_key" ON "tax_iva"("tax_id");

-- AddForeignKey
ALTER TABLE "business" ADD CONSTRAINT "business_subscription_id_fkey" FOREIGN KEY ("subscription_id") REFERENCES "subscription"("subscription_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "business" ADD CONSTRAINT "business_status_id_fkey" FOREIGN KEY ("status_id") REFERENCES "business_status"("status_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "business" ADD CONSTRAINT "business_business_admin_profile_id_fkey" FOREIGN KEY ("business_admin_profile_id") REFERENCES "profile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "business_branch" ADD CONSTRAINT "business_branch_branch_created_by_fkey" FOREIGN KEY ("branch_created_by") REFERENCES "profile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "business_branch" ADD CONSTRAINT "business_branch_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "business"("business_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "business_change_comment" ADD CONSTRAINT "business_change_comment_business_change_id_fkey" FOREIGN KEY ("business_change_id") REFERENCES "business_change"("business_change_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "business_change" ADD CONSTRAINT "business_change_change_status_id_fkey" FOREIGN KEY ("change_status_id") REFERENCES "business_change_status"("business_change_status_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "business_change" ADD CONSTRAINT "business_change_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "business"("business_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "business_comment" ADD CONSTRAINT "business_comment_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "business"("business_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "business_status_log" ADD CONSTRAINT "business_status_log_status_id_fkey" FOREIGN KEY ("status_id") REFERENCES "business_status"("status_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "business_status_log" ADD CONSTRAINT "business_status_log_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "profile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "coupon_comment" ADD CONSTRAINT "coupon_comment_coupon_id_fkey" FOREIGN KEY ("coupon_id") REFERENCES "coupon"("coupon_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "coupon_redeem" ADD CONSTRAINT "coupon_redeem_coupon_id_fkey" FOREIGN KEY ("coupon_id") REFERENCES "coupon"("coupon_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "coupon" ADD CONSTRAINT "coupon_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "business"("business_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "coupon" ADD CONSTRAINT "coupon_status_id_fkey" FOREIGN KEY ("status_id") REFERENCES "coupon_status"("status_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "subscription" ADD CONSTRAINT "subscription_plan_id_fkey" FOREIGN KEY ("plan_id") REFERENCES "plan"("plan_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "subscription" ADD CONSTRAINT "subscription_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "business"("business_id") ON DELETE CASCADE ON UPDATE CASCADE;
