//
//  LightPriceDTO.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 28/12/23.
//

import Foundation
import Domain

struct LightPriceDTO: Decodable {
    let date: String?
    let hour: String?
    let peninsulaPrice: String?
    let ceutaMelillaPrice: String?

    enum CodingKeys: String, CodingKey {
        case date = "Dia"
        case hour = "Hora"
        case peninsulaPrice = "PCB"
        case ceutaMelillaPrice = "CYM"
    }
}

extension LightPriceDTO {
    func toDomain() -> LightPrice {
        LightPrice(date: date ?? "",
                   startHour: hour?.components(separatedBy: "-")[0] ?? "",
                   endHour: hour?.components(separatedBy: "-")[1] ?? "",
                   hourRange: hour ?? "-",
                   peninsulaPrice: (Double(peninsulaPrice?.replacingOccurrences(of: ",", with: ".") ?? "") ?? 0) / 1000,
                   ceutaMelillaPrice: (Double(ceutaMelillaPrice?.replacingOccurrences(of: ",", with: ".") ?? "") ?? 0) / 1000)
    }
}
