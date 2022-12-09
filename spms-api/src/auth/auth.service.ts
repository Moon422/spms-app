import { Injectable } from '@nestjs/common';
import { DbService } from 'src/db/db.service';

@Injectable()
export class AuthService {
    constructor(readonly dbService: DbService) { }

    createSuperAdmin() {
        
    }
}
