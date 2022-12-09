import { Injectable } from '@nestjs/common';
import { DbService } from 'src/db/db.service';
import { CreateDepartmentDto } from './department.dtos';

@Injectable()
export class DepartmentService {
    constructor(private readonly dbService: DbService) {

    }

    async getAllDepartments() {
        return await this.dbService.department.findMany({
            include: {
                school: {
                    select: {
                        id: true,
                        schoolName: true,
                        university: {
                            select: {
                                id: true,
                                universityName: true
                            }
                        }
                    }
                }
            }
        });
    }

    async createDepartment(departmentDto: CreateDepartmentDto) {
        try {
            const dept = await this.dbService.department.create({
                data: {
                    departmentName: departmentDto.name,
                    schoolID: departmentDto.schoolID,
                }
            });

            return dept ? true : false;
        } catch (e) {
            console.log(e);
            return false;
        }
    }
}
