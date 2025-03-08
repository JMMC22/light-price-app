//
//  LightApplianceCost.swift
//  iLuz
//
//  Created by Márquez Crespo, José María on 22/1/25.
//

import Foundation

struct LightApplianceCost: Identifiable {
    let id = UUID()
    let appliance: LightAppliances
    var cost: Double
}
