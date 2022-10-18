//
//  HomeView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 23/9/22.
//

import SwiftUI

// MARK: - Main view
struct HomeView: View {
    @State private var didTapTeamsLink = false
    @State private var didTapPlayersLink = false
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .idle:
                LinksView(didTapTopLinkView: $didTapTeamsLink, didTapBottomLinkView: $didTapPlayersLink)
            }
        }
        
        // MARK: - Navigation destinations
        .navigateToDestination(if: $didTapTeamsLink) { TeamsView() }
        .embedInNavigation(with: .home.title.localized)
    }
}

// MARK: - Canvas preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
