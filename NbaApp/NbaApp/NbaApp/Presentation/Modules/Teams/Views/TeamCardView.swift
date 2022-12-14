//
//  TeamCardView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 15/10/22.
//

import SwiftUI

// MARK: - Representable
struct TeamCardViewRepresentable {
    let logo: String
    let title: String
}

struct TeamCardView: View {
    // MARK: - Parameters
    let representable: TeamCardViewRepresentable
    
    // MARK: - Main view
    var body: some View {
        HStack(spacing: 0) {
            Image(representable.logo)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .padding(.horizontal)
            Text(verbatim: representable.title)
                .lineLimit(1)
                .font(.headline.bold())
                .padding(.trailing)
            Spacer()
        }.padding(.vertical)
        .background { Color.customLightGray }
        .cornerRadius(10)
        .shadow(color: .customGray, radius: 3, x: 0, y: 4)
        .padding(.horizontal)
        .padding(.vertical, 10)
        .listRowSeparator(.hidden)
        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
}

// MARK: - Canvas preview
struct TeamCardView_Previews: PreviewProvider {
    static var previews: some View {
        TeamCardView(representable: .init(
            logo: "Lakers",
            title: "Title"
        )).previewLayout(.sizeThatFits)
    }
}
