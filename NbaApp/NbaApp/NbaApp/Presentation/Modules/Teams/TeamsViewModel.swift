//
//  TeamsViewModel.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 8/10/22.
//

import SwiftUI

// MARK: - Representables
struct TeamsViewReceivedRepresentable {
    let pager: Pagination<Team>
}

// MARK: - States
enum TeamsViewState {
    case loading
    case error
    case received(TeamsViewReceivedRepresentable)
}

// MARK: - ViewModel
@MainActor class TeamsViewModel: ObservableObject {
    private var teamsPager = Pagination<Team>()
    @Published private(set) var state: TeamsViewState = .loading
    
    func getTeams() async {
        Task {
            do {
                let paginatedTeams = try await Network.shared.load(endpoint: TeamsEndpoint.getTeams(page: teamsPager.currentPage).endpoint, of: Paginable<TeamDTO>.self)
                let teams = paginatedTeams.data.compactMap { $0.toBO() }
                teamsPager.setCurrentPage(paginatedTeams.meta.currentPage)
                teamsPager.setItems(teams)
                teamsPager.setNextPage(paginatedTeams.meta.nextPage)
                let representable = TeamsViewReceivedRepresentable(pager: teamsPager)
                state = .received(representable)
            } catch {
                state = .error
            }
        }
    }
}
