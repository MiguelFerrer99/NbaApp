//
//  LinksView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 16/10/22.
//

import SwiftUI

// MARK: - States
enum LinksViewState {
    case idle
    case didTapTopLink
    case didTapBottomLink
}

struct LinksView: View {
    // MARK: - Paramameters
    @Binding var didTapTopLinkView: Bool
    @Binding var didTapBottomLinkView: Bool
    
    // MARK: - Main view
    var body: some View {
        VStack {
            LinkView(representable: .init(
                title: .home.teams.localized,
                color: .black,
                style: .leftToRight
            ), isPressed: $didTapTopLinkView)
                .padding(.vertical, 50)
            LinkView(representable: .init(
                title: .home.players.localized,
                color: .black,
                style: .leftToRight
            ), isPressed: $didTapBottomLinkView)
            Spacer()
        }.padding(.horizontal, 20)
    }
}

// MARK: - Canvas preview
struct LinksView_Previews: PreviewProvider {
    static var previews: some View {
        LinksView(
            didTapTopLinkView: .constant(false),
            didTapBottomLinkView: .constant(false)
        ).previewLayout(.sizeThatFits)
    }
}
