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
        
    var body: some View {
        VStack(spacing: 50) {
            Spacer().frame(height: 10)
            LinkView(title: .home.teams.localized, color: .black, style: .leftToRight, isPressed: $isShowingTeams)
            LinkView(title: .home.players.localized, color: .black, style: .leftToRight, isPressed: $isShowingPlayers)
            Spacer()
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
