import { Module } from '@nestjs/common';
import { AuthModule } from './auth/auth.module';
import { DbModule } from './db/db.module';
import { UniversityModule } from './university/university.module';

@Module({
  imports: [AuthModule, DbModule, UniversityModule],
  controllers: [],
  providers: [],
})
export class AppModule {}
