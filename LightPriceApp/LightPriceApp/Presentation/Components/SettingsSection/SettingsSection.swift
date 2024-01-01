//
//  SettingsSection.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 1/1/24.
//

import SwiftUI

struct SettingsSection<Content: View>: View {

    let title: String
    let content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .LPFont(.Roboto(18, weight: .bold), color: .gray)
            content()
            Divider()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
                SettingsSection(title: "Notificaciones") {
                    Text("Content")
                }
}
