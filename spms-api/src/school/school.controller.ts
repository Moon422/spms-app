import { Controller, Get } from '@nestjs/common';
import { SchoolService } from './school.service';

@Controller('school')
export class SchoolController {
    constructor(readonly schoolService: SchoolService) { }

    @Get("all")
    getAllSchools() {
        return this.schoolService.getAllSchools();
    }
}
