import Foundation
@objc(ReactNativeUserAgent)
class ReactNativeUserAgent: NSObject {

  @objc(getUserAgent:withRejecter:)
  func getUserAgent(resolve:RCTPromiseResolveBlock, reject:RCTPromiseRejectBlock) -> Void {
    do {
      let appNameAndVersion = getAppNameAndVersion()
      let deviceName = UIDevice.current.model
      let systemName = UIDevice.current.systemName
      let systemVersion = UIDevice.current.systemVersion
      let darwinVersion = getDarwinVersion()
      let cfNetworkVersion = getCFNetworkVersion()
      let userAgent = "\(appNameAndVersion) - Darwin/\(darwinVersion) CFNetwork/\(cfNetworkVersion) \(deviceName) \(systemName)/\(systemVersion)"

      resolve(userAgent)
    } catch {
      reject("Error", "Failed to get UserAgent", error)
    }
  }

  private func getAppNameAndVersion() -> String {
    let appName: String
    let appVersion: String

    if let name = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String {
      appName = name
    } else {
      appName = "UnknownApp"
    }

    if let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String {
      appVersion = version
    } else {
      appVersion = "0.0"
    }

    return "\(appName)/\(appVersion)"
  }

  private func getDarwinVersion() -> String {
    var darwinVersion = "Unknown"
    var size: Int = 0

    if sysctlbyname("kern.osversion", nil, &size, nil, 0) == 0 {
      var osVersion = [CChar](repeating: 0, count: size)
      if sysctlbyname("kern.osversion", &osVersion, &size, nil, 0) == 0 {
        darwinVersion = String(cString: osVersion).trimmingCharacters(in: .whitespacesAndNewlines)
      }
    }

    return darwinVersion
  }

  private func getCFNetworkVersion() -> String {
    let cfNetworkVersion = "Unknown"

    if let cfNetworkBundle = Bundle(identifier: "com.apple.CFNetwork") {
      return cfNetworkBundle.infoDictionary?["CFBundleVersion"] as? String ?? cfNetworkVersion
    }

    return cfNetworkVersion
  }
}
