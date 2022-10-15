//
//  PlayersViewModel.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 8/10/22.
//

import SwiftUI

@MainActor class PlayersViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var isGenericError = false
    @Published var players: [Player] = []
    
    func getPlayers() async {
        Task {
            do {
                let playersDTOs = try await Network.shared.load(endpoint: PlayersEndpoint.getPlayers(page: 1).endpoint, of: PaginationDTO<PlayerDTO>.self)
                let players = playersDTOs.data.compactMap { $0.toBO() }
                self.players = players
                isLoading = false
            } catch {
                isGenericError = true
            }
        }
    }
}
