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
    let isLoadingNewPage: Bool
}

// MARK: - States
enum TeamsViewState {
    case loading
    case error
    case received(TeamsViewReceivedRepresentable)
}

@MainActor class TeamsViewModel: ObservableObject {
    // MARK: - Parameters
    private var teamsPager = Pagination<Team>()
    @Published private(set) var state: TeamsViewState = .loading
    
    // MARK: - Functions
    func getTeams() async {
        Task {
            do {
                if teamsPager.currentPage > 1 {
                    let representable = TeamsViewReceivedRepresentable(pager: teamsPager, isLoadingNewPage: true)
                    state = .received(representable)
                }
                let paginatedTeams = try await Network.shared.load(endpoint: TeamsEndpoint.getTeams(page: teamsPager.currentPage).endpoint, of: Paginable<TeamDTO>.self)
                let teams = paginatedTeams.data.compactMap { $0.toBO() }
                teamsPager.setItems(teams)
                teamsPager.setNextPage(paginatedTeams.meta.nextPage)
                let representable = TeamsViewReceivedRepresentable(pager: teamsPager, isLoadingNewPage: false)
                state = .received(representable)
            } catch {
                state = .error
            }
        }
    }
}
