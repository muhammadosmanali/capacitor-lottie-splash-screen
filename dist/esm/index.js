import { registerPlugin } from '@capacitor/core';
const CapacitorLottieSplashScreen = registerPlugin('CapacitorLottieSplashScreen', {
    web: () => import('./web').then(m => new m.CapacitorLottieSplashScreenWeb()),
});
export * from './definitions';
export { CapacitorLottieSplashScreen };
//# sourceMappingURL=index.js.map