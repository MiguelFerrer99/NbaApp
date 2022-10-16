//
//  HomeView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 23/9/22.
//

import SwiftUI

struct HomeView: View {
    @State private var isShowingTeams = false
    @State private var isShowingPlayers = false
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .idle:
                LinksView(representable: .init(
                    isShowingTeams: $isShowingTeams,
                    isShowingPlayers: $isShowingPlayers))
            }
        }
        .navigationDestination(isPresented: $isShowingTeams, destination: { TeamsView() })
        .navigationDestination(isPresented: $isShowingPlayers, destination: { PlayersView() })
        .embedInNavigationStack(with: .home.title.localized)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}