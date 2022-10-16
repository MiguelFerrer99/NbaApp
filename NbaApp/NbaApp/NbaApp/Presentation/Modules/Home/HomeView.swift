//
//  HomeView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 23/9/22.
//

import SwiftUI

// MARK: - Main view
struct HomeView: View {
    @State private var linksViewState: LinksViewState = .idle
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .idle:
                LinksView(state: $linksViewState)
            }
        }
        
        // MARK: - Navigation destinations
        .navigationDestination(isPresented: .constant(linksViewState == .didTapTopLink), destination: { TeamsView() })
        .navigationDestination(isPresented: .constant(linksViewState == .didTapBottomLink), destination: { PlayersView() })
        .embedInNavigationStack(with: .home.title.localized)
    }
}

// MARK: - Canvas preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
