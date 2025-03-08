//
//  LightApplianceCost.swift
//  iLuz
//
//  Created by Márquez Crespo, José María on 22/1/25.
//

import Foundation

public struct LightApplianceCost: Identifiable {
    public let id = UUID()
    public let appliance: LightAppliances
    public var cost: Double
    
    public init(appliance: LightAppliances,
                cost: Double) {
        self.appliance = appliance
        self.cost = cost
    }
}
