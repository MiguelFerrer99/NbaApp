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
    @Binding var getNextPage: Bool
    @Binding var didTapPlayer: Bool
    @Binding var selectedPlayer: Player
    
    var body: some View {
        List {
            ForEach(representable.pager.getItems()) { player in
                let fullname = "\(player.firstname) \(player.lastname)"
                PlayerCardView(representable: .init(title: fullname))
                    .onTapGesture { select(player) }
                    .onAppear { check(player) }
                    .listRowSeparator(.hidden)
            }
            LoadingFooterView()
        }.listStyle(.plain)
    }
    
    func select(_ player: Player) {
        didTapPlayer = true
        selectedPlayer = player
    }

    func check(_ player: Player) {
        if representable.pager.getItems().last == player && !representable.pager.isLastPage {
            getNextPage = true
        }
    }
}

// MARK: - Canvas preview
struct PlayersListView_Previews: PreviewProvider {
    static var previews: some View {
        PlayersListView(
            representable: .init(pager: .init()),
            getNextPage: .constant(false),
            didTapPlayer: .constant(false),
            selectedPlayer: .constant(.previewInit())
        ).previewLayout(.sizeThatFits)
    }
}
