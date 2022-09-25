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
        NavigationView {
            VStack(spacing: 50) {
                Spacer().frame(height: 10)
                LinkView(title: .home.teams.localized, isPressed: $isShowingTeams)
                LinkView(title: .home.players.localized, isPressed: $isShowingPlayers)
                Spacer()
                
                // MARK: NavigationLinks
                NavigationLink(destination: TeamsView(), isActive: $isShowingTeams) {}
                NavigationLink(destination: PlayersView(), isActive: $isShowingPlayers) {}
            }
            .navigationTitle(String.home.title.localized)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
