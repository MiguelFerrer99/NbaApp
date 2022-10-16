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
            case .received(let representable):
                PlayersListView(representable: .init(pager: representable.pager))
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
