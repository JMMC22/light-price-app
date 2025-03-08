//
//  String+getAppVersion.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 11/11/24.
//

import Foundation

extension Bundle {

    static func getAppVersion() -> String {
        if let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return appVersion
        }
        return "Unknown"
    }
}
