//
//  TeamsView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 24/9/22.
//

import SwiftUI

// MARK: - Main view
struct TeamsView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var didTapNavBarBackButton = false
    @State private var didTapGenericErrorViewLink = false
    @State private var getNextPage = false
    @State private var didTapTeam = false
    @State private var selectedTeam: Team = .previewInit()
    @StateObject private var viewModel = TeamsViewModel()
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .loading:
                LoadingView()
            case .error:
                GenericErrorView(didTapLink: $didTapGenericErrorViewLink)
            case .received(let representable):
                TeamsListView(representable: .init(pager: representable.pager),
                              getNextPage: $getNextPage,
                              didTapTeam: $didTapTeam,
                              selectedTeam: $selectedTeam)
            }
        }.configureNavBar(with: .init(title: .teams.title.localized), and: $didTapNavBarBackButton)
        .onLoad { Task { await viewModel.getTeams() } }
        
        // MARK: - Navigation destinations
        .navigationDestination(isPresented: $didTapTeam, destination: { TeamDetailView(representable: .init(team: selectedTeam)) })
        
        // MARK: - Subviews events listeners
        .onChange(of: didTapNavBarBackButton) { _ in dismiss() }
        .onChange(of: didTapGenericErrorViewLink) { _ in dismiss() }
        .onChange(of: getNextPage) { _ in Task { await viewModel.getTeams() } }
    }
}

// MARK: - Canvas preview
struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView()
    }
}
