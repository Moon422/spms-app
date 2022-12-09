import { Module } from '@nestjs/common';
import { AuthModule } from './auth/auth.module';
import { DbModule } from './db/db.module';
import { UniversityModule } from './university/university.module';
import { SchoolModule } from './school/school.module';

@Module({
  imports: [AuthModule, DbModule, UniversityModule, SchoolModule],
  controllers: [],
  providers: [],
})
export class AppModule {}
