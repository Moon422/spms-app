import { Module } from '@nestjs/common';
import { DbModule } from 'src/db/db.module';
import { DepartmentController } from './department.controller';
import { DepartmentService } from './department.service';

@Module({
  controllers: [DepartmentController],
  providers: [DepartmentService],
  imports: [DbModule]
})
export class DepartmentModule {}
