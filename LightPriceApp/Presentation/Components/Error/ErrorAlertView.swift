//
//  ErrorAlertView.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 11/11/24.
//

import SwiftUI

struct ErrorAlertView: View {

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: "exclamationmark.shield.fill")
            Text("generic.error")
        }
        .LPFont(.roboto(14, weight: .semiBold), color: .white)
        .padding(8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 4).fill(.customRed01))
    }
}

#Preview {
    ErrorAlertView()
}
