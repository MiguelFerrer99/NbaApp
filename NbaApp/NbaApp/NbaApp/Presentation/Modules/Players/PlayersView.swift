//
//  PlayersView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 20/10/22.
//

import SwiftUI

struct PlayersView: View {
    // MARK: - Parameters
    @StateObject private var viewModel = PlayersViewModel()
    @State private var getNextPage = false
    @State private var didTapPlayer = false
    @State private var selectedPlayer: Player?
    @Binding var isPresented: Bool
    
    // MARK: - Main view
    var body: some View {
        VStack {
            switch viewModel.state {
            case .loading:
                LoadingView()
            case .error:
                GenericErrorView(isPresented: $isPresented)
            case .received(let representable):
                PlayersListView(representable: .init(pager: representable.pager, isLoadingNewPage: representable.isLoadingNewPage),
                                getNextPage: $getNextPage,
                                selectedPlayer: $selectedPlayer)
            }
        }.configureNavBar(with: .init(title: .players.title.localized))
        .onLoad { Task { await viewModel.getPlayers() } }
        
        // MARK: - Navigation destinations
        .navigationDestination(isPresented: $didTapPlayer, destination: {
            if let selectedPlayer = selectedPlayer { PlayerDetailView(representable: .init(player: selectedPlayer)) }
        })
        
        // MARK: - Subviews events listeners
        .onChange(of: getNextPage) { _ in Task { await viewModel.getPlayers() } }
        .onChange(of: selectedPlayer) { _ in didTapPlayer = true }
    }
}

// MARK: - Canvas preview
struct PlayersView_Previews: PreviewProvider {
    static var previews: some View {
        PlayersView(isPresented: .constant(true))
    }
}
