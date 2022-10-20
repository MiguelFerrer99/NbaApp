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
}

// MARK: - States
enum PlayersViewState {
    case loading
    case error
    case received(PlayersViewReceivedRepresentable)
}

// MARK: - ViewModel
@MainActor class PlayersViewModel: ObservableObject {
    private var playersPager = Pagination<Player>()
    @Published private(set) var state: PlayersViewState = .loading
    
    func getPlayers() async {
        Task {
            do {
                let paginatedPlayers = try await Network.shared.load(endpoint: PlayersEndpoint.getPlayers(page: playersPager.currentPage).endpoint, of: Paginable<PlayerDTO>.self)
                let players = paginatedPlayers.data.compactMap { $0.toBO() }
                playersPager.setCurrentPage(paginatedPlayers.meta.currentPage)
                playersPager.setItems(players)
                playersPager.setNextPage(paginatedPlayers.meta.nextPage)
                let representable = PlayersViewReceivedRepresentable(pager: playersPager)
                state = .received(representable)
            } catch {
                state = .error
            }
        }
    }
}
