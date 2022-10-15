//
//  PlayersView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 24/9/22.
//

import SwiftUI

struct PlayersView: View {
    @Environment(\.dismiss) var dismiss
    @State private var goBack = false
    @StateObject private var viewModel = PlayersViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                EmptyView()
            }.configureNavBar(with: .players.title.localized, and: dismiss)
            
            LoadingView(isLoading: viewModel.isLoading)
            GenericErrorView(isGenericError: viewModel.isGenericError, isPressed: $goBack)
        }
        .onChange(of: goBack, perform: { _ in dismiss() })
        .task { await viewModel.getPlayers() }
    }
}

struct PlayersView_Previews: PreviewProvider {
    static var previews: some View {
        PlayersView()
    }
}
