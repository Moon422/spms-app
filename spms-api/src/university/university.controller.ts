import { Body, Controller, Get, Post } from '@nestjs/common';
import { CreateUniversityDto } from './university.dto';
import { UniversityService } from './university.service';

@Controller('university')
export class UniversityController {
    constructor(readonly universityService: UniversityService) { }

    @Get("all")
    getAllUniversities() {
        return this.universityService.getAllUniversities();
    }

    @Post("add")
    async addUniversity(@Body() university: CreateUniversityDto) {
        const added = await this.universityService.addUniversity(university);

        if (added) {
            return {
                msg: "University Added Successfully"
            }
        }

        return {
            msg: "Error adding university"
        }
    }
}
