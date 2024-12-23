import { WebPlugin } from '@capacitor/core';
export class CapacitorLottieSplashScreenWeb extends WebPlugin {
    async echo(options) {
        console.log('ECHO', options);
        return options;
    }
    async appLoaded() {
        return 0;
    }
    async isAnimating() {
        return { isAnimating: false };
    }
}
//# sourceMappingURL=web.js.map