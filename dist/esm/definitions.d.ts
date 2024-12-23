import type { PluginListenerHandle } from '@capacitor/core';
export interface CapacitorLottieSplashScreenPlugin {
    echo(options: {
        value: string;
    }): Promise<{
        value: string;
    }>;
    /**
     * Indicate to the plugin that the app has loaded.
     *
     * Run as early as possible when your app is loaded.
     * This will ensure that on animation end the layer of the splash screen is removed
     * and touch interactions will go to the app.
     **/
    appLoaded(): Promise<any>;
    isAnimating(): Promise<{
        isAnimating: boolean;
    }>;
    addListener(eventName: 'onAnimationEnd', listenerFunc: () => void): Promise<PluginListenerHandle> | PluginListenerHandle;
}
