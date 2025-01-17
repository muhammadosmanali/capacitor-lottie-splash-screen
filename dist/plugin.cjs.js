'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var core = require('@capacitor/core');

const CapacitorLottieSplashScreen = core.registerPlugin('CapacitorLottieSplashScreen', {
    web: () => Promise.resolve().then(function () { return web; }).then(m => new m.CapacitorLottieSplashScreenWeb()),
});

class CapacitorLottieSplashScreenWeb extends core.WebPlugin {
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

var web = /*#__PURE__*/Object.freeze({
    __proto__: null,
    CapacitorLottieSplashScreenWeb: CapacitorLottieSplashScreenWeb
});

exports.CapacitorLottieSplashScreen = CapacitorLottieSplashScreen;
//# sourceMappingURL=plugin.cjs.js.map
