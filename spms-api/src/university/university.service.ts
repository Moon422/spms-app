import { Injectable } from '@nestjs/common';
import { DbService } from 'src/db/db.service';

@Injectable()
export class UniversityService {
    constructor(readonly dbService: DbService) { }

    async getAllUniversities() {
        const universities = await this.dbService.university.findMany();

        return universities;
    }
}
