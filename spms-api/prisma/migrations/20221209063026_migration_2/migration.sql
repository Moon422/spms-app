/*
  Warnings:

  - You are about to drop the column `FacultyID` on the `Faculty` table. All the data in the column will be lost.
  - You are about to drop the column `StudentID` on the `Student` table. All the data in the column will be lost.
  - Added the required column `facultyID` to the `Faculty` table without a default value. This is not possible if the table is not empty.
  - Added the required column `studentID` to the `Student` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Faculty` DROP COLUMN `FacultyID`,
    ADD COLUMN `facultyID` VARCHAR(20) NOT NULL;

-- AlterTable
ALTER TABLE `Student` DROP COLUMN `StudentID`,
    ADD COLUMN `studentID` VARCHAR(20) NOT NULL;

-- CreateTable
CREATE TABLE `SuperAdmin` (
    `id` VARCHAR(191) NOT NULL,
    `organizationID` VARCHAR(20) NOT NULL,
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

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
