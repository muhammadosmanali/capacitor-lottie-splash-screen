# @capacitor/lottie-splash-screen

Lottie splash screen plugin for capacitor

## Install

```bash
npm install git+https://github.com/muhammadosmanali/capacitor-lottie-splash-screen.git
npx cap sync
```

Add to `capacitor.config.ts` or `capcitor.config.json`
```
CapacitorLottieSplashScreen: {
  Enabled: true,
  LottieAnimationLocation: "public/[web/path/to.json]"
}
```

if you were previously using Capacitor Splash Screen set the following in you capacitor config
```
SplashScreen: {
  launchAutoHide: true,
  launchShowDuration: 0,
},
```

## API

<docgen-index>

* [`echo(...)`](#echo)
* [`appLoaded()`](#apploaded)
* [`isAnimating()`](#isanimating)
* [`addListener('onAnimationEnd', ...)`](#addlisteneronanimationend)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### echo(...)

```typescript
echo(options: { value: string; }) => Promise<{ value: string; }>
```

| Param         | Type                            |
| ------------- | ------------------------------- |
| **`options`** | <code>{ value: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### appLoaded()

```typescript
appLoaded() => Promise<any>
```

Indicate to the plugin that the app has loaded.

Run as early as possible when your app is loaded.
This will ensure that on animation end the layer of the splash screen is removed
and touch interactions will go to the app.

**Returns:** <code>Promise&lt;any&gt;</code>

--------------------


### isAnimating()

```typescript
isAnimating() => Promise<{ isAnimating: boolean; }>
```

**Returns:** <code>Promise&lt;{ isAnimating: boolean; }&gt;</code>

--------------------


### addListener('onAnimationEnd', ...)

```typescript
addListener(eventName: 'onAnimationEnd', listenerFunc: () => void) => Promise<PluginListenerHandle> & PluginListenerHandle
```

| Param              | Type                          |
| ------------------ | ----------------------------- |
| **`eventName`**    | <code>'onAnimationEnd'</code> |
| **`listenerFunc`** | <code>() =&gt; void</code>    |

**Returns:** <code>Promise&lt;<a href="#pluginlistenerhandle">PluginListenerHandle</a>&gt; & <a href="#pluginlistenerhandle">PluginListenerHandle</a></code>

--------------------


### Interfaces


#### PluginListenerHandle

| Prop         | Type                                      |
| ------------ | ----------------------------------------- |
| **`remove`** | <code>() =&gt; Promise&lt;void&gt;</code> |

</docgen-api>
