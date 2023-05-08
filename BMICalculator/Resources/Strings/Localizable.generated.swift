// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Localizable {
  internal enum MainViewController {
    /// Localizable.strings
    ///   BMICalculator
    /// 
    ///   Created by Łukasz Skopiński on 25/04/2023.
    internal static let buttonTitle = Localizable.tr("Localizable", "mainViewController.buttonTitle", fallback: "Calculate")
    /// Height
    internal static let lefttLowerText = Localizable.tr("Localizable", "mainViewController.lefttLowerText", fallback: "Height")
    /// Weight
    internal static let leftUpperText = Localizable.tr("Localizable", "mainViewController.leftUpperText", fallback: "Weight")
    /// %s cm
    internal static func rightLowerText(_ p1: UnsafePointer<CChar>) -> String {
      return Localizable.tr("Localizable", "mainViewController.rightLowerText", p1, fallback: "%s cm")
    }
    /// %s kg
    internal static func rightUpperText(_ p1: UnsafePointer<CChar>) -> String {
      return Localizable.tr("Localizable", "mainViewController.rightUpperText", p1, fallback: "%s kg")
    }
    /// Calculate your BMI
    internal static let titleLabelText = Localizable.tr("Localizable", "mainViewController.titleLabelText", fallback: "Calculate your BMI")
  }
  internal enum ResultViewController {
    /// Recalculate
    internal static let buttonTitle = Localizable.tr("Localizable", "resultViewController.buttonTitle", fallback: "Recalculate")
    /// Your Result
    internal static let tittleLabel = Localizable.tr("Localizable", "resultViewController.tittleLabel", fallback: "Your Result")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Localizable {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
