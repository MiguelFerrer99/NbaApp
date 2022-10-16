//
//  LinksView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 16/10/22.
//

import SwiftUI

struct LinksView: View {
    let representable: LinksViewRepresentable
    
    var body: some View {
        VStack {
            LinkView(title: .home.teams.localized, color: .black, style: .leftToRight, dismiss: nil, isPressed: representable.$isShowingTeams)
                .padding(.vertical, 50)
            LinkView(title: .home.players.localized, color: .black, style: .leftToRight, dismiss: nil, isPressed: representable.$isShowingPlayers)
            Spacer()
        }
    }
}

struct LinksView_Previews: PreviewProvider {
    static var previews: some View {
        LinksView(representable: .init(
            isShowingTeams: .constant(false),
            isShowingPlayers: .constant(false)
        )).previewLayout(.sizeThatFits)
    }
}
