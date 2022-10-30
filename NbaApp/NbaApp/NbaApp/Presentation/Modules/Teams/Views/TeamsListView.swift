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
    let isLoadingNewPage: Bool
}

struct TeamsListView: View {
    // MARK: - Parameters
    let representable: TeamsListViewRepresentable
    @Binding var getNextPage: Bool
    @Binding var selectedTeam: Team?
    
    // MARK: - Main view
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            LazyVStack {
                ForEach(representable.pager.getItems()) { team in
                    TeamCardView(representable: .init(logo: team.name, title: team.fullname))
                        .onTapGesture { selectedTeam = team }
                        .onAppear { check(team) }
                }
                LoadingFooterView().isHidden(!representable.isLoadingNewPage)
            }
        }
    }
    
    // MARK: - Functions
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
            representable: .init(pager: .init(), isLoadingNewPage: false),
            getNextPage: .constant(false),
            selectedTeam: .constant(nil)
        ).previewLayout(.sizeThatFits)
    }
}
