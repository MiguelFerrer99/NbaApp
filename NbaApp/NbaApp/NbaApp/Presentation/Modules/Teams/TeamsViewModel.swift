//
//  TeamsViewModel.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 8/10/22.
//

import SwiftUI

@MainActor class TeamsViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var isGenericError = false
    @Published var teams: [Team] = []
    
    func getAllTeams() async {
        Task {
            do {
                let teamsDTOs = try await Network.shared.load(endpoint: TeamsEndpoint.getAllTeams(page: 1).endpoint, of: PaginationDTO<TeamDTO>.self)
                let teams = teamsDTOs.data.compactMap { $0.toBO() }
                self.teams = teams
                isLoading = false
            } catch {
                isGenericError = true
            }
        }
    }
}
