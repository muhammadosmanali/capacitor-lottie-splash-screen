import Capacitor
import Foundation

@objc(CapacitorLottieSplashScreenPlugin)
public class CapacitorLottieSplashScreenPlugin: CAPPlugin {
  public static var isEnabledStatic = true
  private let implementation = CapacitorLottieSplashScreen()

  @objc func echo(_ call: CAPPluginCall) {
    let value = call.getString("value") ?? ""
    call.resolve([
      "value": implementation.echo(value)
    ])
  }

  override public func load() {
    if CapacitorLottieSplashScreenPlugin.isEnabledStatic {
      let isEnabled = getConfigValue("enabled") as? Bool ?? true
      if isEnabled {
        if #available(iOS 13.0, *) {
          if UITraitCollection.current.userInterfaceStyle == .dark {
            implementation.loadLottie(
              view: self.bridge?.viewController?.view,
              path: self.getConfigValue("lottieAnimationLocationDark") as? String,
              appearance: "dark")
          } else {
            implementation.loadLottie(
              view: self.bridge?.viewController?.view,
              path: self.getConfigValue("lottieAnimationLocationLight") as? String,
              appearance: "light")
          }
        } else {
          implementation.loadLottie(
            view: self.bridge?.viewController?.view,
            path: self.getConfigValue("lottieAnimationLocationLight") as? String,
            appearance: "light")
        }

      }
      implementation.onAnimationEvent = onAnimationEvent
    }
  }

  public func onAnimationEvent(event: AnimationEventListener) {
    print("onAnimationEvent", event.listenerEvent)
    self.bridge?.triggerWindowJSEvent(eventName: event.listenerEvent)
    self.notifyListeners(event.listenerEvent, data: nil)
  }

  @objc func appLoaded(_ call: CAPPluginCall) {
    implementation.onAppLoaded()
    call.resolve()
  }

  @objc func isAnimating(_ call: CAPPluginCall) {
    call.resolve([
      "isAnimating": implementation.isAnimating()
    ])
  }

}
