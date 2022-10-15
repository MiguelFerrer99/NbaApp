//
//  TeamsPlayersViewModel.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 8/10/22.
//

import SwiftUI

@MainActor class TeamsPlayersViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var isGenericError = false
    @Published var teams: [Team] = []
    @Published var players: [Player] = []
    
    func getTeams() async {
        Task {
            do {
                let teamsDTOs = try await Network.shared.load(endpoint: TeamsEndpoint.getTeams(page: 1).endpoint, of: PaginationDTO<TeamDTO>.self)
                let teams = teamsDTOs.data.compactMap { $0.toBO() }
                self.teams = teams
                isLoading = false
            } catch {
                isGenericError = true
            }
        }
    }
    
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
