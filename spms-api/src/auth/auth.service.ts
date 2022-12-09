import { Injectable } from '@nestjs/common';
import { genSalt, hash } from 'bcrypt';
import { DbService } from 'src/db/db.service';

@Injectable()
export class AuthService {
    constructor(readonly dbService: DbService) { }

    async createSuperAdmin() {
        const salt = await genSalt();
        const passwordHash = await hash("topsecret", salt);

        const superAdminUser = await this.dbService.user.create({
            data: {
                firstName: "Mahfuzur",
                lastName: "Rahman",
                email: "mahfuzurrm98@gmail.com",
                phone: "+8801748689039",
                house: "A20/8",
                street: "Citylane, Anandapur",
                town: "Savar",
                city: "Dhaka",
                dateOfBirth: new Date(1999, 10, 22),
                joiningDate: new Date(),
                userType: "SUPER_ADMIN",
                auth: {
                    create: {
                        email: "mahfuzurrm98@gmail.com",
                        password: 
                    }
                }
            }
        });
    }
}
