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
    let isLoadingNewPage: Bool
}

struct PlayersListView: View {
    // MARK: - Parameters
    let representable: PlayersListViewRepresentable
    @Binding var getNextPage: Bool
    @Binding var didTapPlayer: Bool
    @Binding var selectedPlayer: Player
    
    // MARK: - Main view
    var body: some View {
        List {
            ForEach(representable.pager.getItems(), id: \.self) { player in
                PlayerCardView(representable: .init(title: player.fullname))
                    .onTapGesture { select(player) }
                    .onAppear { check(player) }
                    .listRowSeparator(.hidden)
            }
            LoadingFooterView().isHidden(!representable.isLoadingNewPage)
        }.listStyle(.plain)
    }
    
    // MARK: - Functions
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
            representable: .init(pager: .init(), isLoadingNewPage: false),
            getNextPage: .constant(false),
            didTapPlayer: .constant(false),
            selectedPlayer: .constant(.previewInit())
        ).previewLayout(.sizeThatFits)
    }
}
