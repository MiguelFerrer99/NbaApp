//
//  TeamsPlayersView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 24/9/22.
//

import SwiftUI

enum TeamsPlayersInputStyle {
    case teams
    case players
}

struct TeamsPlayersView: View {
    let style: TeamsPlayersInputStyle
    @Environment(\.dismiss) private var dismiss
    @State private var goBack = false
    @StateObject private var viewModel = TeamsPlayersViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                EmptyView()
            }.configureNavBar(with: style == .teams ? .teams.title.localized : .players.title.localized, and: dismiss)
            
            LoadingView(isLoading: viewModel.isLoading)
            GenericErrorView(isGenericError: viewModel.isGenericError, isPressed: $goBack)
        }
        .onChange(of: goBack, perform: { _ in dismiss() })
        .task {
            if style == .teams {
                await viewModel.getTeams()
            } else {
                await viewModel.getPlayers()
            }
        }
    }
}

struct TeamsPlayersView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsPlayersView(style: .teams)
    }
}
