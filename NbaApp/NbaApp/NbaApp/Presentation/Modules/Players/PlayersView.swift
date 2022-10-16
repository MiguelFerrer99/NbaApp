//
//  PlayersView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 24/9/22.
//

import SwiftUI

struct PlayersView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = PlayersViewModel()
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .loading:
                LoadingView()
            case .error:
                GenericErrorView(dismiss: dismiss)
            case .received(let playersPager):
                List {
                    ForEach(playersPager.getItems()) { player in
                        PlayerCardView(title: player.fullname, isPressed: .constant(false))
                    }
                    LoadingFooterView()
                }.listStyle(.plain)
            }
        }.configureNavBar(with: .players.title.localized, and: dismiss)
        .task { await viewModel.getPlayers() }
    }
}

struct PlayersView_Previews: PreviewProvider {
    static var previews: some View {
        PlayersView()
    }
}
