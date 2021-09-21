import UIKit
import Flutter
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    AppCenter.start(withAppSecret: "24f37c55-c5cb-4ba2-82d3-1f133e2f3f5e", services:[
      Analytics.self,
      Crashes.self
    ])

    GMSServices.provideAPIKey("AIzaSyDuvKjR_UiGlyNhUryUHiIzJ9inbecS7F4")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  

  }
}
