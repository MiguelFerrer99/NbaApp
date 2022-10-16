//
//  TeamsListView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 16/10/22.
//

import SwiftUI

struct TeamsListView: View {
    let representable: TeamsListViewRepresentable
    
    var body: some View {
        List {
            ForEach(representable.pager.getItems()) { team in
                TeamCardView(representable: TeamCardViewRepresentable(
                    title: team.fullname,
                    isPressed: .constant(false)))
            }
            LoadingFooterView()
        }.listStyle(.plain)
    }
}

struct TeamsListView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsListView(representable: .init(
            pager: .init()
        )).previewLayout(.sizeThatFits)
    }
}
