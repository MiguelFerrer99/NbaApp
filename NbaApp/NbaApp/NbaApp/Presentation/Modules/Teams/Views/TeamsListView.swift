//
//  TeamsListView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 16/10/22.
//

import SwiftUI

// MARK: - Representable
struct TeamsListViewRepresentable {
    let pager: Pagination<Team>
}

// MARK: - States
enum TeamsListViewState {
    case idle
    case didTapCard(Team)
}

// MARK: - Main view
struct TeamsListView: View {
    let representable: TeamsListViewRepresentable
    @State private var teamCardViewState: TeamCardViewState = .idle
    @Binding var state: TeamsListViewState
    
    var body: some View {
        List {
            ForEach(representable.pager.getItems()) { team in
                TeamCardView(representable: .init(team: team), state: $teamCardViewState)
            }
            LoadingFooterView()
        }.listStyle(.plain)
        
        // MARK: - Subviews events listeners
        .onChange(of: teamCardViewState) { _ in didChangeTeamCardViewState() }
    }
    
    // MARK: - Subviews events performers
    func didChangeTeamCardViewState() {
        switch teamCardViewState {
        case .idle:
            break
        case .didTap(let team):
            state = .didTapCard(team)
        }
    }
}

// MARK: - Canvas preview
struct TeamsListView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsListView(
            representable: .init(pager: .init()),
            state: .constant(.idle)
        ).previewLayout(.sizeThatFits)
    }
}
