import { NestFactory } from '@nestjs/core';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import { applicationVersion } from '@platform/commons';
import { MainModule } from '@platform/server/main.module';

async function bootstrap() {
    const app = await NestFactory.create(MainModule);

    // 全局前缀
    app.setGlobalPrefix('api');

    const config = new DocumentBuilder()
        .setTitle('接口文档')
        .setDescription('接口文档')
        .setVersion(applicationVersion)
        .build();
    const document = SwaggerModule.createDocument(app, config);
    SwaggerModule.setup('api-docs', app, document);

    await app.listen(8888);
}

bootstrap().then(() => {
    console.log(`Application version - ${applicationVersion}.`);
});
