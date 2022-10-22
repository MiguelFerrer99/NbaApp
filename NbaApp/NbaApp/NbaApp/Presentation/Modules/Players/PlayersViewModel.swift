//
//  PlayersViewModel.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 20/10/22.
//

import SwiftUI

// MARK: - Representables
struct PlayersViewReceivedRepresentable {
    let pager: Pagination<Player>
    let isLoadingNewPage: Bool
}

// MARK: - States
enum PlayersViewState {
    case loading
    case error
    case received(PlayersViewReceivedRepresentable)
}

@MainActor class PlayersViewModel: ObservableObject {
    // MARK: - Parameters
    private var playersPager = Pagination<Player>()
    @Published private(set) var state: PlayersViewState = .loading
    
    // MARK: - Functions
    func getPlayers() async {
        Task {
            do {
                if playersPager.currentPage > 1 {
                    let representable = PlayersViewReceivedRepresentable(pager: playersPager, isLoadingNewPage: true)
                    state = .received(representable)
                }
                let paginatedPlayers = try await Network.shared.load(endpoint: PlayersEndpoint.getPlayers(page: playersPager.currentPage).endpoint, of: Paginable<PlayerDTO>.self)
                let players = paginatedPlayers.data.compactMap { $0.toBO() }
                playersPager.setItems(players)
                playersPager.setNextPage(paginatedPlayers.meta.nextPage)
                let representable = PlayersViewReceivedRepresentable(pager: playersPager, isLoadingNewPage: false)
                state = .received(representable)
            } catch {
                state = .error
            }
        }
    }
}
