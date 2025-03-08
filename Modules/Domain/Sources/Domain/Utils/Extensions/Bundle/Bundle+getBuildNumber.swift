//
//  Bundle+getBuildNumber.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 11/11/24.
//

import Foundation

public extension Bundle {
    static func getBuildNumber() -> String {
        if let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
            return buildNumber
        }
        return "Unknown"
    }
}
