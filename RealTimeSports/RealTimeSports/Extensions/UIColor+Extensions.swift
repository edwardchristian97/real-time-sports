//
//  UIColor+Extensions.swift
//  RealTimeSports
//
//  Created by Nagy Edward Christian on 23.10.2024.
//
import UIKit

extension UIColor {

    static var appGreen: UIColor {
        UIColor(red: 50/255, green: 153/255, blue: 78/255, alpha: 1)
    }

    static var appDarkGreen: UIColor {
        UIColor(red: 0/255, green: 102/255, blue: 51/255, alpha: 1)
    }

    static var dynamicAppGreen: UIColor {
        dynamicColor(lightModeColor: .appGreen, darkModeColor: .appDarkGreen)
    }

    static var invertedDynamicAppGreen: UIColor {
        dynamicColor(lightModeColor: .appDarkGreen, darkModeColor: .appGreen)
    }

    static var invertedSystemBackground: UIColor {
        dynamicColor(lightModeColor: .black, darkModeColor: .white)
    }

    static func dynamicColor(lightModeColor: UIColor, darkModeColor: UIColor) -> UIColor {
        UIColor { (uiTraitCollection: UITraitCollection) -> UIColor in
            switch uiTraitCollection.userInterfaceStyle {
            case .dark:
                return darkModeColor
            case .unspecified, .light:
                return lightModeColor
            @unknown default:
                return lightModeColor
            }
        }
    }

}
