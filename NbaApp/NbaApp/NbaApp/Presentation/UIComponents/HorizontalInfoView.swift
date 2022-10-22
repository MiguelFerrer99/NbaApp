//
//  HorizontalInfoView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 22/10/22.
//

import SwiftUI

// MARK: - Representable
struct HorizontalInfoViewRepresentable {
    let titleLeft: String
    let titleRight: String
}

struct HorizontalInfoView: View {
    // MARK: - Parameters
    let representable: HorizontalInfoViewRepresentable
    
    // MARK: - Main view
    var body: some View {
        HStack {
            Text(representable.titleLeft)
                .multilineTextAlignment(.leading)
                .lineLimit(1)
                .layoutPriority(1)
                .bold()
            Spacer()
            Text(representable.titleRight)
                .multilineTextAlignment(.trailing)
                .lineLimit(1)
                .bold()
        }.padding(.vertical, 10)
        .padding(.horizontal)
        .background { Color.customLightGray }
        .cornerRadius(12)
    }
}

// MARK: - Canvas preview
struct HorizontalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalInfoView(representable: .init(
            titleLeft: "Title left",
            titleRight: "Title right")
        ).previewLayout(.sizeThatFits)
    }
}
