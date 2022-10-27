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
    @Binding var selectedPlayer: Player?
    
    // MARK: - Main view
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            LazyVStack {
                ForEach(representable.pager.getItems(), id: \.self) { player in
                    PlayerCardView(representable: .init(playerID: player.id, logoUrlString: player.logoUrlString, title: player.fullname))
                        .onTapGesture { select(player) }
                        .onAppear { check(player) }
                }
                LoadingFooterView().isHidden(!representable.isLoadingNewPage)
            }
        }
    }
    
    // MARK: - Functions
    func select(_ player: Player) {
        selectedPlayer = player
        didTapPlayer = true
    }

    func check(_ player: Player) {
        if representable.pager.getItems().last == player && !representable.pager.isLastPage {
            getNextPage.toggle()
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
            selectedPlayer: .constant(nil)
        ).previewLayout(.sizeThatFits)
    }
}
