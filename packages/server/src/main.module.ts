import { MiddlewareConsumer, Module, NestModule } from '@nestjs/common';
//
import CoreModule from '@platform/server/core/core.module';
import CommonsModule from '@platform/server/commons/commons.module';

@Module({
    imports: [CommonsModule, CoreModule],
})
export class MainModule implements NestModule {
    configure(consumer: MiddlewareConsumer) {
        console.log(`MainModule.configure()...`);
    }
}
