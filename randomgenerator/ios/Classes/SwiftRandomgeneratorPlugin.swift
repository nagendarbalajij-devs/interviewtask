import Flutter
import UIKit

public class SwiftRandomgeneratorPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "randomgenerator", binaryMessenger: registrar.messenger())
    let instance = SwiftRandomgeneratorPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if(call.method == "getRandom") {
      let date = Date().timeIntervalSinceReferenceDate
      print(date)
      result(date)
    }
    result("isdfOS " + UIDevice.current.systemVersion)
  }
}
