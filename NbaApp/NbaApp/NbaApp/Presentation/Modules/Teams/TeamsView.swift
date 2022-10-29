//
//  TeamsView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 24/9/22.
//

import SwiftUI

struct TeamsView: View {
    // MARK: - Parameters
    @StateObject private var viewModel = TeamsViewModel()
    @State private var didTapNavBarBackButton = false
    @State private var didTapGenericErrorViewLink = false
    @State private var getNextPage = false
    @State private var didTapTeam = false
    @State private var selectedTeam: Team?
    @Binding var isPresented: Bool
    
    // MARK: - Main view
    var body: some View {
        VStack {
            switch viewModel.state {
            case .loading:
                LoadingView()
            case .error:
                GenericErrorView(didTapLink: $didTapGenericErrorViewLink)
            case .received(let representable):
                TeamsListView(representable: .init(pager: representable.pager, isLoadingNewPage: representable.isLoadingNewPage),
                              getNextPage: $getNextPage,
                              selectedTeam: $selectedTeam)
            }
        }.configureNavBar(with: .init(title: .teams.title.localized), and: $didTapNavBarBackButton)
        .onLoad { Task { await viewModel.getTeams() } }
        
        // MARK: - Navigation destinations
        .navigationDestination(isPresented: $didTapTeam, destination: {
            if let selectedTeam = selectedTeam {
                TeamDetailView(representable: .init(team: selectedTeam), isPresented: $didTapTeam)
            }
        })
        
        // MARK: - Subviews events listeners
        .onChange(of: didTapNavBarBackButton) { _ in isPresented = false }
        .onChange(of: didTapGenericErrorViewLink) { _ in isPresented = false }
        .onChange(of: getNextPage) { _ in Task { await viewModel.getTeams() } }
        .onChange(of: selectedTeam) { _ in didTapTeam = true }
    }
}

// MARK: - Canvas preview
struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView(isPresented: .constant(true))
    }
}
