import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty } from 'class-validator';

export default class CredentialsDto {
    @ApiProperty()
    @IsNotEmpty()
    grant_type: 'refresh_token' | 'password';

    @ApiProperty()
    username: string;

    @ApiProperty()
    password: string;
}
