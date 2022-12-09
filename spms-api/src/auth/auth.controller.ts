import { Body, Controller, Get, HttpException, HttpStatus, Post } from '@nestjs/common';
import { LoginDto } from './auth.dtos';
import { AuthService } from './auth.service';

@Controller('auth')
export class AuthController {
    constructor(private readonly authService: AuthService) { }

    // @Get()
    // createSuperAdmin() {
    //     this.authService.createSuperAdmin();
    // }

    @Post("login")
    login(@Body() loginDto: LoginDto) {
        const authPayload = this.authService.login(loginDto);

        if (authPayload) {
            return authPayload;
        } else {
            throw new HttpException("Authentication Failed", HttpStatus.BAD_REQUEST);
        }
    }
}
