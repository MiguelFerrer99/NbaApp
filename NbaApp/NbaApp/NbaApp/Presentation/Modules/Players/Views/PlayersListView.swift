//
//  PlayersListView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 16/10/22.
//

import SwiftUI

struct PlayersListView: View {
    let representable: PlayersListViewRepresentable
    
    var body: some View {
        List {
            ForEach(representable.pager.getItems()) { player in
                PlayerCardView(representable: .init(
                    title: player.firstname,
                    isPressed: .constant(false)))
            }
            LoadingFooterView()
        }.listStyle(.plain)
    }
}

struct PlayersListView_Previews: PreviewProvider {
    static var previews: some View {
        PlayersListView(representable: .init(
            pager: .init())
        ).previewLayout(.sizeThatFits)
    }
}
