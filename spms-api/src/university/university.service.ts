import { Injectable } from '@nestjs/common';
import { DbService } from 'src/db/db.service';
import { CreateUniversityDto } from './university.dto';

@Injectable()
export class UniversityService {
    constructor(readonly dbService: DbService) { }

    async getAllUniversities() {
        const universities = await this.dbService.university.findMany();

        return universities;
    }

    async addUniversity(universityDto: CreateUniversityDto) {
        try {
            const university = await this.dbService.university.create({
                data: {
                    universityName: universityDto.name,
                    universityDomain: universityDto.domain
                }
            });

            return university ? true : false;
        } catch (e) {
            console.log(e);
            return false;
        }
    }
}
