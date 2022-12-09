import { Injectable } from '@nestjs/common';
import { DbService } from 'src/db/db.service';
import { CreateSchoolDto } from './school.dto';

@Injectable()
export class SchoolService {
    constructor(readonly dbService: DbService) {

    }

    async getAllSchools() {
        const schools = await this.dbService.school.findMany();
    }

    createSchool(schoolDto: CreateSchoolDto) {
        try {
            const school = this.dbService.school.create({
                data: {
                    schoolName: schoolDto.name,
                    schoolCode: schoolDto.code,
                    university: {
                        connect: {
                            
                        }
                    }
                }
            })
        }
    }
}
