import { Module } from '@nestjs/common';
import { UniversityService } from './university.service';
import { UniversityController } from './university.controller';
import { DbModule } from 'src/db/db.module';

@Module({
  providers: [UniversityService],
  controllers: [UniversityController],
  imports: [DbModule]
})
export class UniversityModule {}
