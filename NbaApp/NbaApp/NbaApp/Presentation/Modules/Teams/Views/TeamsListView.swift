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
    @Binding var didTapTeam: Bool
    @Binding var selectedTeam: Team
    
    var body: some View {
        List(representable.pager.getItems()) { team in
            TeamCardView(representable: .init(title: team.fullname))
                .onTapGesture {
                    didTapTeam = true
                    selectedTeam = team
                }.listRowSeparator(.hidden)
        }.listStyle(.plain)
    }
}

// MARK: - Canvas preview
struct TeamsListView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsListView(
            representable: .init(pager: .init()),
            didTapTeam: .constant(false),
            selectedTeam: .constant(.previewInit())
        ).previewLayout(.sizeThatFits)
    }
}
