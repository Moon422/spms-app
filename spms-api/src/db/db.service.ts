import { INestApplication, OnModuleInit } from "@nestjs/common";
import { PrismaClient } from "@prisma/client";

export class DbService extends PrismaClient implements OnModuleInit {
    getAllUniversities() {
        throw new Error('Method not implemented.');
    }
    async onModuleInit() {
        await this.$connect();
    }

    enableShutdownHooks(app: INestApplication) {
        this.$on('beforeExit', async () => {
            await app.close()
        });
    }
}