import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  private let CHANNEL = "com.ambition.platform_channel"

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let methodChannel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: controller.binaryMessenger)
    
    methodChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
      if call.method == "sendMessage" {
        if let args = call.arguments as? [String: Any],
           let message = args["message"] as? String,
           let timestamp = args["timestamp"] as? String {
          self.showAlert(message: "\(message) Received at \(timestamp)")
          result("Message from iOS: Received your message.")
        } else {
          result(FlutterError(code: "UNAVAILABLE", message: "Message not available.", details: nil))
        }
      } else {
        result(FlutterMethodNotImplemented)
      }
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
  private func showAlert(message: String) {
    let alert = UIAlertController(title: "Message", message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    window?.rootViewController?.present(alert, animated: true, completion: nil)
  }
}
