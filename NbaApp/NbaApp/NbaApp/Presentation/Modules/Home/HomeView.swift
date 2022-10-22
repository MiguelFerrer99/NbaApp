//
//  HomeView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 23/9/22.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Paramameters
    @State private var didTapTeamsLink = false
    @State private var didTapPlayersLink = false
    @StateObject private var viewModel = HomeViewModel()
    
    // MARK: - Main view
    var body: some View {
        VStack {
            switch viewModel.state {
            case .idle:
                LinksView(didTapTopLinkView: $didTapTeamsLink, didTapBottomLinkView: $didTapPlayersLink)
            }
        }
        
        // MARK: - Navigation destinations
        .navigationDestination(isPresented: $didTapTeamsLink, destination: { TeamsView() })
        .navigationDestination(isPresented: $didTapPlayersLink, destination: { PlayersView() })
        .embedInNavigation(with: .home.title.localized)
    }
}

// MARK: - Canvas preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
