//
//  PlayersListView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 20/10/22.
//

import SwiftUI

// MARK: - Representable
struct PlayersListViewRepresentable {
    let pager: Pagination<Player>
}

// MARK: - Main view
struct PlayersListView: View {
    let representable: PlayersListViewRepresentable
    @Binding var didTapPlayer: Bool
    @Binding var selectedPlayer: Player
    
    var body: some View {
        List(representable.pager.getItems()) { player in
            let fullname = "\(player.firstname) \(player.lastname)"
            PlayerCardView(representable: .init(title: fullname))
                .onTapGesture {
                    didTapPlayer = true
                    selectedPlayer = player
                }.listRowSeparator(.hidden)
        }.listStyle(.plain)
    }
}

// MARK: - Canvas preview
struct PlayersListView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsListView(
            representable: .init(pager: .init()),
            didTapTeam: .constant(false),
            selectedTeam: .constant(.previewInit())
        ).previewLayout(.sizeThatFits)
    }
}
