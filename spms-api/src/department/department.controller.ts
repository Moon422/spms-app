import { Body, Controller, Get, HttpException, HttpStatus, Post } from '@nestjs/common';
import { CreateDepartmentDto } from './department.dtos';
import { DepartmentService } from './department.service';

@Controller('department')
export class DepartmentController {
    constructor(readonly deptService: DepartmentService) {

    }

    @Get("all")
    getAllDepartments() { 
        return this.deptService.getAllDepartments();
    }

    @Post("add")
    async createDepartment(@Body() departmentDto: CreateDepartmentDto) {
        const success = this.deptService.createDepartment(departmentDto);

        if (success) {
            return {
                msg: "Department created successfully"
            }
        } else {
            throw new HttpException("Department failed to create", HttpStatus.BAD_REQUEST);
        }
    }
}
