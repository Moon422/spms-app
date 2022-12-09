import { Controller, Get } from '@nestjs/common';
import { UniversityService } from './university.service';

@Controller('university')
export class UniversityController {
    constructor(readonly universityService: UniversityService) { }

    @Get("all")
    getAllUniversities() {
        return this.universityService.getAllUniversities();
    }
}
