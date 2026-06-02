import Foundation

enum Diagnostics {
  static func log(_ message: String) {
    #if DEBUG
    print("[SubviewIdentityDemo] \(message)")
    #endif
  }
}
