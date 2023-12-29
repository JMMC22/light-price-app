//
//  DateFormatterExtension.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 29/12/23.
//

import Foundation

extension DateFormatter {

    static let fullDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        dateFormatter.dateFormat = "dd/MM/YYYY"
        return dateFormatter
    }()

    static let yearMonthDayFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()
}
