import { Injectable } from '@nestjs/common';
import { User, SuperAdmin } from '@prisma/client';
import { genSalt, hash, compare } from 'bcrypt';
import { DbService } from 'src/db/db.service';
import { LoginDto } from './auth.dtos';

@Injectable()
export class AuthService {
    constructor(readonly dbService: DbService) { }

    // async createSuperAdmin() {
    //     const salt = await genSalt();
    //     const passwordHash = await hash("topsecret", salt);

    //     const superAdminUser = await this.dbService.user.create({
    //         data: {
    //             firstName: "Mahfuzur",
    //             lastName: "Rahman",
    //             email: "mahfuzurrm98@gmail.com",
    //             phone: "+8801748689039",
    //             house: "A20/8",
    //             street: "Citylane, Anandapur",
    //             town: "Savar",
    //             city: "Dhaka",
    //             dateOfBirth: new Date(1999, 10, 22),
    //             joiningDate: new Date(),
    //             userType: "SUPER_ADMIN",
    //             auth: {
    //                 create: {
    //                     email: "mahfuzurrm98@gmail.com",
    //                     password: passwordHash
    //                 }
    //             },
    //             superAdmin: {
    //                 create: {
    //                     organizationID: "007"
    //                 }
    //             }
    //         }
    //     });
    // }

    login(loginDto: LoginDto) {
        return this.validateUser(loginDto);
    }

    async validateUser(loginDto: LoginDto) {
        const auth = await this.dbService.auth.findUnique({
            where: {
                email: loginDto.email
            },
            select: {
                password: true,
                userID: true
            }
        });

        if (auth) {
            const passwordMatched = await compare(loginDto.password, auth.password);

            if (passwordMatched) {
                const user = await this.dbService.user.findUnique({
                    where: {
                        id: auth.userID
                    }
                });
                
                switch (user.userType) {
                    case 'SUPER_ADMIN':
                        const superAdmin = await this.dbService.superAdmin.findUnique({
                            where: {
                                id: user.id
                            }
                        });

                        return this.generateSuperAdminAuthToken(user, superAdmin);
                        
                
                    default:
                        break;
                }
            }
        }
    }

    generateSuperAdminAuthToken(user: User, superAdmin: SuperAdmin) {
        const { userID, ...x } = {...user, ...superAdmin };
    }
}


