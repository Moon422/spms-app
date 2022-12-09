/*
  Warnings:

  - You are about to alter the column `password` on the `Auth` table. The data in that column could be lost. The data in that column will be cast from `Blob` to `VarChar(191)`.

*/
-- AlterTable
ALTER TABLE `Auth` MODIFY `password` VARCHAR(191) NOT NULL;
