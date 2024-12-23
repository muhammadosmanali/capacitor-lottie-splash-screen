import { WebPlugin } from '@capacitor/core';
import type { CapacitorLottieSplashScreenPlugin } from './definitions';
export declare class CapacitorLottieSplashScreenWeb extends WebPlugin implements CapacitorLottieSplashScreenPlugin {
    echo(options: {
        value: string;
    }): Promise<{
        value: string;
    }>;
    appLoaded(): Promise<any>;
    isAnimating(): Promise<{
        isAnimating: boolean;
    }>;
}
