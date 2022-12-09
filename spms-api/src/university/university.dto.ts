import { IsNotEmpty, IsString } from "class-validator";

export class UniversityDto {
    @IsString()
    @IsNotEmpty()
    name: string;

    @IsString()
    @IsNotEmpty()
    domain: string;
}