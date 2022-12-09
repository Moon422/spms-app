import { Module } from '@nestjs/common';
import { AuthService } from './auth.service';
import { AuthController } from './auth.controller';
import { DbService } from 'src/db/db.service';

@Module({
  providers: [AuthService],
  controllers: [AuthController],
  imports: [DbService]
})
export class AuthModule {}
