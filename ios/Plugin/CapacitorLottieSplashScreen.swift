import Foundation
import Lottie
import UIKit

@objc public enum AnimationEventListener: Int {
  case onAnimationEnd
}

extension AnimationEventListener {
  var listenerEvent: String {
    switch self {
    case .onAnimationEnd:
      return "onAnimationEnd"
    }
  }
}

@objc public class CapacitorLottieSplashScreen: NSObject {

  private var animationView: LottieAnimationView?
  private var isAppLoaded = false
  private var isAnimationEnded = !CapacitorLottieSplashScreenPlugin.isEnabledStatic

  public typealias AnimationEventListenerCallback = (AnimationEventListener) -> Void

  @objc public var onAnimationEvent: AnimationEventListenerCallback?

  public func isAnimating() -> Bool {
    return !isAnimationEnded
  }

  func onAppLoaded() {
    isAppLoaded = true
    if isAnimationEnded {
      hideSplashScreen()
    }
  }

  @objc public func echo(_ value: String) -> String {
    print(value)
    return value
  }

  public func loadLottie(view: UIView?, path: String?, appearance: String?) {
    if let view = view,
      let path = path,
      let filename = path.components(separatedBy: ".").first
    {
      animationView = .init(name: filename)
      animationView!.frame = UIScreen.main.bounds
      animationView!.contentMode = .scaleAspectFit
      animationView!.loopMode = .playOnce
      animationView!.animationSpeed = 0.7
      animationView!.play { completed in
        if completed {
          self.isAnimationEnded = true
          self.hideSplashScreen()
          self.onAnimationEvent?(.onAnimationEnd)
        }
      }
      animationView!.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview(animationView!)

      NSLayoutConstraint.activate([
        animationView!.widthAnchor.constraint(equalTo: view.widthAnchor),
        animationView!.heightAnchor.constraint(equalTo: view.heightAnchor),
      ])
    }
  }

  func hideSplashScreen() {
    DispatchQueue.main.async {
      self.animationView?.removeFromSuperview()
    }
  }
}
