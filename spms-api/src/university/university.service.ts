import { Injectable } from '@nestjs/common';
import { DbService } from 'src/db/db.service';
import { UniversityDto } from './university.dto';

@Injectable()
export class UniversityService {
    constructor(readonly dbService: DbService) { }

    async getAllUniversities() {
        const universities = await this.dbService.university.findMany();

        return universities;
    }

    async addUniversity(university: UniversityDto) {
        const addedUni = await this.dbService.university.create({
            data: {
                universityName: university.name,
                universityDomain: university.domain
            }
        });

        if (addedUni) {
            return true;
        }

        return false;
    }
}
