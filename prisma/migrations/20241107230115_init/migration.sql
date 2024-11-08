-- AlterTable
ALTER TABLE "Profile" ADD COLUMN     "has_access_to_business" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN     "is_active" BOOLEAN NOT NULL DEFAULT true;
