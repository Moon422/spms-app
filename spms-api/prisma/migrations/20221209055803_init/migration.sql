-- CreateTable
CREATE TABLE `University` (
    `id` VARCHAR(191) NOT NULL,
    `universityName` VARCHAR(255) NOT NULL,
    `universityDomain` VARCHAR(100) NOT NULL,

    UNIQUE INDEX `University_universityName_key`(`universityName`),
    UNIQUE INDEX `University_universityDomain_key`(`universityDomain`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `School` (
    `id` VARCHAR(191) NOT NULL,
    `schoolName` VARCHAR(255) NOT NULL,
    `schoolCode` VARCHAR(6) NOT NULL,
    `universityID` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Department` (
    `id` VARCHAR(191) NOT NULL,
    `departmentName` VARCHAR(255) NOT NULL,
    `departmentCode` VARCHAR(6) NOT NULL,
    `schoolID` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Program` (
    `id` VARCHAR(191) NOT NULL,
    `programName` VARCHAR(255) NOT NULL,
    `programCode` VARCHAR(6) NOT NULL,
    `totalCredits` INTEGER NOT NULL,
    `departmentID` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Course` (
    `id` VARCHAR(191) NOT NULL,
    `courseName` VARCHAR(255) NOT NULL,
    `courseCode` VARCHAR(6) NOT NULL,
    `courseCredit` INTEGER NOT NULL,
    `coOfferedID` VARCHAR(191) NOT NULL,
    `programID` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Section` (
    `id` VARCHAR(191) NOT NULL,
    `sectionNumber` INTEGER NOT NULL,
    `semester` ENUM('SPRING', 'SUMMER', 'AUTUMN') NOT NULL,
    `year` INTEGER NOT NULL,
    `maximumCapacity` INTEGER NOT NULL,
    `facultyID` VARCHAR(191) NOT NULL,
    `courseID` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CourseRegistration` (
    `studentID` VARCHAR(191) NOT NULL,
    `sectionID` VARCHAR(191) NOT NULL,
    `registrationDate` DATE NOT NULL,

    PRIMARY KEY (`studentID`, `sectionID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Assessment` (
    `id` VARCHAR(191) NOT NULL,
    `questionNumber` INTEGER NOT NULL,
    `assessmentType` ENUM('CLASS_TEST', 'MID_TERM', 'FINAL_TERM', 'PROJECT', 'ASSIGNMENT') NOT NULL,
    `totalMarks` DOUBLE NOT NULL,
    `sectionID` VARCHAR(191) NOT NULL,
    `coID` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Evaluation` (
    `studentID` VARCHAR(191) NOT NULL,
    `assessmentID` VARCHAR(191) NOT NULL,
    `obtainedMark` DOUBLE NOT NULL,

    PRIMARY KEY (`studentID`, `assessmentID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PLO` (
    `id` VARCHAR(191) NOT NULL,
    `ploNumber` INTEGER NOT NULL,
    `ploDetails` VARCHAR(512) NOT NULL,
    `programID` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CO` (
    `id` VARCHAR(191) NOT NULL,
    `coNumber` INTEGER NOT NULL,
    `coDetails` VARCHAR(512) NOT NULL,
    `courseID` VARCHAR(191) NOT NULL,
    `ploID` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Student` (
    `id` VARCHAR(191) NOT NULL,
    `StudentID` VARCHAR(20) NOT NULL,
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
    `programID` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Faculty` (
    `id` VARCHAR(191) NOT NULL,
    `FacultyID` VARCHAR(20) NOT NULL,
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
    `departmentID` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_prerequisite` (
    `A` VARCHAR(191) NOT NULL,
    `B` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `_prerequisite_AB_unique`(`A`, `B`),
    INDEX `_prerequisite_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `School` ADD CONSTRAINT `School_universityID_fkey` FOREIGN KEY (`universityID`) REFERENCES `University`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Department` ADD CONSTRAINT `Department_schoolID_fkey` FOREIGN KEY (`schoolID`) REFERENCES `School`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Program` ADD CONSTRAINT `Program_departmentID_fkey` FOREIGN KEY (`departmentID`) REFERENCES `Department`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Course` ADD CONSTRAINT `Course_coOfferedID_fkey` FOREIGN KEY (`coOfferedID`) REFERENCES `Course`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Course` ADD CONSTRAINT `Course_programID_fkey` FOREIGN KEY (`programID`) REFERENCES `Program`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Section` ADD CONSTRAINT `Section_facultyID_fkey` FOREIGN KEY (`facultyID`) REFERENCES `Faculty`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Section` ADD CONSTRAINT `Section_courseID_fkey` FOREIGN KEY (`courseID`) REFERENCES `Course`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CourseRegistration` ADD CONSTRAINT `CourseRegistration_studentID_fkey` FOREIGN KEY (`studentID`) REFERENCES `Student`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CourseRegistration` ADD CONSTRAINT `CourseRegistration_sectionID_fkey` FOREIGN KEY (`sectionID`) REFERENCES `Section`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Assessment` ADD CONSTRAINT `Assessment_sectionID_fkey` FOREIGN KEY (`sectionID`) REFERENCES `Section`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Assessment` ADD CONSTRAINT `Assessment_coID_fkey` FOREIGN KEY (`coID`) REFERENCES `CO`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Evaluation` ADD CONSTRAINT `Evaluation_studentID_fkey` FOREIGN KEY (`studentID`) REFERENCES `Student`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Evaluation` ADD CONSTRAINT `Evaluation_assessmentID_fkey` FOREIGN KEY (`assessmentID`) REFERENCES `Assessment`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PLO` ADD CONSTRAINT `PLO_programID_fkey` FOREIGN KEY (`programID`) REFERENCES `Program`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CO` ADD CONSTRAINT `CO_courseID_fkey` FOREIGN KEY (`courseID`) REFERENCES `Course`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CO` ADD CONSTRAINT `CO_ploID_fkey` FOREIGN KEY (`ploID`) REFERENCES `PLO`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Student` ADD CONSTRAINT `Student_programID_fkey` FOREIGN KEY (`programID`) REFERENCES `Program`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Faculty` ADD CONSTRAINT `Faculty_departmentID_fkey` FOREIGN KEY (`departmentID`) REFERENCES `Department`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_prerequisite` ADD CONSTRAINT `_prerequisite_A_fkey` FOREIGN KEY (`A`) REFERENCES `Course`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_prerequisite` ADD CONSTRAINT `_prerequisite_B_fkey` FOREIGN KEY (`B`) REFERENCES `Course`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
