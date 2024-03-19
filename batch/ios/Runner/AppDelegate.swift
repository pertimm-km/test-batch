import UIKit
import Flutter
import batch_flutter
import Batch

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    BatchUNUserNotificationCenterDelegate.registerAsDelegate()
    BatchFlutterPlugin.configuration.APIKey = "API_KEY"
    BatchFlutterPlugin.setup()
    BatchPush.refreshToken()
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
