import { Body, Controller, Get, HttpException, HttpStatus, Post } from '@nestjs/common';
import { CreateSchoolDto } from './school.dto';
import { SchoolService } from './school.service';

@Controller('school')
export class SchoolController {
    constructor(readonly schoolService: SchoolService) { }

    @Get("all")
    getAllSchools() {
        return this.schoolService.getAllSchools();
    }

    @Post("add")
    async createSchool(@Body() schoolDto: CreateSchoolDto) {
        const success = await this.schoolService.createSchool(schoolDto);

        if (success) {
            return {
                msg: "School created successfully"
            };
        } else {
            throw new HttpException("School not created", HttpStatus.BAD_REQUEST);
        }
    }
}
