//
//  LightPriceError.swift
//  LPDomain
//
//  Created by José María Márquez Crespo on 11/11/24.
//

public enum LightPriceError: Error {
    case generic
    case unknown
}

extension LightPriceError {

    var localizedDescription: String {
        switch self {
        case .generic:
            return "An unexpected error occurred."
        case .unknown:
            return "An unknown error occurred."
        }
    }
}
