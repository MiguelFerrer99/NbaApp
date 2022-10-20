//
//  PlayersView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 20/10/22.
//

import SwiftUI

// MARK: - Main view
struct PlayersView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var didTapNavBarBackButton = false
    @State private var didTapGenericErrorViewLink = false
    @State private var didTapPlayer = false
    @State private var selectedPlayer: Player = .previewInit()
    @StateObject private var viewModel = PlayersViewModel()
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .loading:
                LoadingView()
            case .error:
                GenericErrorView(didTapLink: $didTapGenericErrorViewLink)
            case .received(let representable):
                PlayersListView(representable: .init(pager: representable.pager), didTapPlayer: $didTapPlayer, selectedPlayer: $selectedPlayer)
            }
        }.modifier(NavBarConfiguration(representable: .init(title: .players.title.localized), didTapBackButton: $didTapNavBarBackButton))
        .onLoad { Task { await viewModel.getPlayers() } }
        
        // MARK: - Navigation destinations
        .navigationDestination(isPresented: $didTapPlayer, destination: { PlayerDetailView(representable: .init(player: selectedPlayer)) })
        
        // MARK: - Subviews events listeners
        .onChange(of: didTapNavBarBackButton) { _ in dismiss() }
        .onChange(of: didTapGenericErrorViewLink) { _ in dismiss() }
    }
}

// MARK: - Canvas preview
struct PlayersView_Previews: PreviewProvider {
    static var previews: some View {
        PlayersView()
    }
}
