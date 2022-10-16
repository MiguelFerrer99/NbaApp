//
//  TeamsView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 24/9/22.
//

import SwiftUI

// MARK: - Main view
struct TeamsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var navBarState: NavBarConfiguration.NavBarState = .idle
    @State private var genericErrorViewState: GenericErrorViewState = .idle
    @State private var teamsListViewState: TeamsListViewState = .idle
    @StateObject private var viewModel = TeamsViewModel()
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .loading:
                LoadingView()
            case .error:
                GenericErrorView(state: $genericErrorViewState)
            case .received(let representable):
                TeamsListView(representable: .init(pager: representable.pager), state: $teamsListViewState)
            }
        }.modifier(NavBarConfiguration(representable: .init(title: .teams.title.localized), state: $navBarState))
        .task { await viewModel.getTeams() }
        
        // MARK: - Navigation destinations
        // TODO: Add navigation to TeamDetailView()
        
        // MARK: - Subviews events listeners
        .onChange(of: navBarState) { _ in didChangeNavBarState() }
        .onChange(of: genericErrorViewState) { _ in didChangeGenericErrorViewState() }
    }
    
    // MARK: - Subviews events performers
    func didChangeNavBarState() {
        switch navBarState {
        case .idle:
            break
        case .didTapBack:
            dismiss()
        }
    }
    
    func didChangeGenericErrorViewState() {
        switch genericErrorViewState {
        case .idle:
            break
        case .didTapLink:
            dismiss()
        }
    }
}

// MARK: - Canvas preview
struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView()
    }
}
