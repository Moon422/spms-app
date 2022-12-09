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

    async addUniversity(university: CreateUniversityDto) {
        try {
            const addedUni = await this.dbService.university.create({
                data: {
                    universityName: university.name,
                    universityDomain: university.domain
                }
            });
        } catch (e) {
            console.log(e);
            return false;
        }
    }
}
