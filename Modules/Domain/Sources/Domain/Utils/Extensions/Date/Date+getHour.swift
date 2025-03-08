//
//  Date+getHour.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 30/12/23.
//

import Foundation

public extension Date {
    func getHour() -> String {
        let calendar = Calendar.current
        let currentHour = calendar.component(.hour, from: self)
        let currentMinute = calendar.component(.minute, from: self)

        return "\(String(format: "%02d", currentHour)):\(String(format: "%02d", currentMinute))"
    }
}
