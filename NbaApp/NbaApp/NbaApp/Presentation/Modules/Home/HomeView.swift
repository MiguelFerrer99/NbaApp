//
//  HomeView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 23/9/22.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Parameters
    @StateObject private var viewModel = HomeViewModel()
    @State private var didTapTeamsLink = false
    @State private var didTapPlayersLink = false
    
    // MARK: - Main view
    var body: some View {
        VStack {
            switch viewModel.state {
            case .idle:
                LinksView(didTapTopLinkView: $didTapTeamsLink, didTapBottomLinkView: $didTapPlayersLink)
            }
        }
        
        // MARK: - Navigation destinations
        .navigationDestination(isPresented: $didTapTeamsLink, destination: { TeamsView(isPresented: $didTapTeamsLink) })
        .navigationDestination(isPresented: $didTapPlayersLink, destination: { PlayersView(isPresented: $didTapPlayersLink) })
        .embedInNavigation(with: .init(title: .home.title.localized))
    }
}

// MARK: - Canvas preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
