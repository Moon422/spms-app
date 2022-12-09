import { ConsoleLogger, Injectable } from '@nestjs/common';
import { DbService } from 'src/db/db.service';
import { CreateSchoolDto } from './school.dto';

@Injectable()
export class SchoolService {
    constructor(readonly dbService: DbService) {

    }

    async getAllSchools() {
        const schools = await this.dbService.school.findMany({
            include: {
                university: {
                    select: {
                        id: true,
                        universityName: true
                    }
                }
            }
        });

        return schools;
    }

    async createSchool(schoolDto: CreateSchoolDto) {
        // console.log(schoolDto);
        try {
            const school = await this.dbService.school.create({
                data: {
                    schoolName: schoolDto.name,
                    schoolCode: schoolDto.code,
                    universityID: schoolDto.universityID
                },
                include: {
                    university: {
                        select: {
                            universityName: true
                        }
                    }
                }
            });

            if (school) {
                console.log(school.university);
                return true;
            } else {
                return false;
            }
        }
        catch (e) {
            console.log(e)
            return false;
        }
    }
}
