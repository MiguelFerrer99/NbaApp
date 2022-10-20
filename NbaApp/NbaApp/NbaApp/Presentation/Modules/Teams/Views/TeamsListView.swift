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

// MARK: - Main view
struct TeamsListView: View {
    let representable: TeamsListViewRepresentable
    @Binding var getNextPage: Bool
    @Binding var didTapTeam: Bool
    @Binding var selectedTeam: Team
    
    var body: some View {
        List {
            ForEach(representable.pager.getItems()) { team in
                TeamCardView(representable: .init(title: team.fullname))
                    .onTapGesture { select(team) }
                    .onAppear { check(team) }
                    .listRowSeparator(.hidden)
            }
            LoadingFooterView()
        }.listStyle(.plain)
    }
    
    func select(_ team: Team) {
        didTapTeam = true
        selectedTeam = team
    }

    func check(_ team: Team) {
        if representable.pager.getItems().last == team && !representable.pager.isLastPage {
            getNextPage = true
        }
    }
}

// MARK: - Canvas preview
struct TeamsListView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsListView(
            representable: .init(pager: .init()),
            getNextPage: .constant(false),
            didTapTeam: .constant(false),
            selectedTeam: .constant(.previewInit())
        ).previewLayout(.sizeThatFits)
    }
}
