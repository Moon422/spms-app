/*
  Warnings:

  - You are about to drop the column `city` on the `Faculty` table. All the data in the column will be lost.
  - You are about to drop the column `dateOfBirth` on the `Faculty` table. All the data in the column will be lost.
  - You are about to drop the column `email` on the `Faculty` table. All the data in the column will be lost.
  - You are about to drop the column `firstName` on the `Faculty` table. All the data in the column will be lost.
  - You are about to drop the column `house` on the `Faculty` table. All the data in the column will be lost.
  - You are about to drop the column `joiningDate` on the `Faculty` table. All the data in the column will be lost.
  - You are about to drop the column `lastName` on the `Faculty` table. All the data in the column will be lost.
  - You are about to drop the column `phone` on the `Faculty` table. All the data in the column will be lost.
  - You are about to drop the column `street` on the `Faculty` table. All the data in the column will be lost.
  - You are about to drop the column `town` on the `Faculty` table. All the data in the column will be lost.
  - You are about to drop the column `city` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `dateOfBirth` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `email` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `firstName` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `house` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `joiningDate` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `lastName` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `phone` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `street` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `town` on the `Student` table. All the data in the column will be lost.
  - You are about to drop the column `city` on the `SuperAdmin` table. All the data in the column will be lost.
  - You are about to drop the column `dateOfBirth` on the `SuperAdmin` table. All the data in the column will be lost.
  - You are about to drop the column `email` on the `SuperAdmin` table. All the data in the column will be lost.
  - You are about to drop the column `firstName` on the `SuperAdmin` table. All the data in the column will be lost.
  - You are about to drop the column `house` on the `SuperAdmin` table. All the data in the column will be lost.
  - You are about to drop the column `joiningDate` on the `SuperAdmin` table. All the data in the column will be lost.
  - You are about to drop the column `lastName` on the `SuperAdmin` table. All the data in the column will be lost.
  - You are about to drop the column `phone` on the `SuperAdmin` table. All the data in the column will be lost.
  - You are about to drop the column `street` on the `SuperAdmin` table. All the data in the column will be lost.
  - You are about to drop the column `town` on the `SuperAdmin` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[userID]` on the table `Faculty` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[userID]` on the table `Student` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[userID]` on the table `SuperAdmin` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `userID` to the `Faculty` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userID` to the `Student` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userID` to the `SuperAdmin` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Faculty` DROP COLUMN `city`,
    DROP COLUMN `dateOfBirth`,
    DROP COLUMN `email`,
    DROP COLUMN `firstName`,
    DROP COLUMN `house`,
    DROP COLUMN `joiningDate`,
    DROP COLUMN `lastName`,
    DROP COLUMN `phone`,
    DROP COLUMN `street`,
    DROP COLUMN `town`,
    ADD COLUMN `userID` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `Student` DROP COLUMN `city`,
    DROP COLUMN `dateOfBirth`,
    DROP COLUMN `email`,
    DROP COLUMN `firstName`,
    DROP COLUMN `house`,
    DROP COLUMN `joiningDate`,
    DROP COLUMN `lastName`,
    DROP COLUMN `phone`,
    DROP COLUMN `street`,
    DROP COLUMN `town`,
    ADD COLUMN `userID` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `SuperAdmin` DROP COLUMN `city`,
    DROP COLUMN `dateOfBirth`,
    DROP COLUMN `email`,
    DROP COLUMN `firstName`,
    DROP COLUMN `house`,
    DROP COLUMN `joiningDate`,
    DROP COLUMN `lastName`,
    DROP COLUMN `phone`,
    DROP COLUMN `street`,
    DROP COLUMN `town`,
    ADD COLUMN `userID` VARCHAR(191) NOT NULL;

-- CreateTable
CREATE TABLE `User` (
    `id` VARCHAR(191) NOT NULL,
    `firstName` VARCHAR(55) NOT NULL,
    `lastName` VARCHAR(55) NOT NULL,
    `email` VARCHAR(55) NOT NULL,
    `phone` CHAR(14) NOT NULL,
    `house` VARCHAR(30) NULL,
    `street` VARCHAR(100) NULL,
    `town` VARCHAR(100) NOT NULL,
    `city` VARCHAR(100) NOT NULL,
    `dateOfBirth` DATE NOT NULL,
    `joiningDate` DATE NOT NULL,
    `userType` ENUM('SUPER_ADMIN', 'UGCIEB', 'UNIVERSITY_ADMIN', 'VC', 'DEAN', 'DEPT_HEAD', 'FACULTY', 'STUDENT') NOT NULL,

    UNIQUE INDEX `User_email_key`(`email`),
    UNIQUE INDEX `User_phone_key`(`phone`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Auth` (
    `id` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `password` BLOB NOT NULL,
    `userID` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Auth_email_key`(`email`),
    UNIQUE INDEX `Auth_userID_key`(`userID`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `Faculty_userID_key` ON `Faculty`(`userID`);

-- CreateIndex
CREATE UNIQUE INDEX `Student_userID_key` ON `Student`(`userID`);

-- CreateIndex
CREATE UNIQUE INDEX `SuperAdmin_userID_key` ON `SuperAdmin`(`userID`);

-- AddForeignKey
ALTER TABLE `Student` ADD CONSTRAINT `Student_userID_fkey` FOREIGN KEY (`userID`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Faculty` ADD CONSTRAINT `Faculty_userID_fkey` FOREIGN KEY (`userID`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SuperAdmin` ADD CONSTRAINT `SuperAdmin_userID_fkey` FOREIGN KEY (`userID`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Auth` ADD CONSTRAINT `Auth_userID_fkey` FOREIGN KEY (`userID`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
