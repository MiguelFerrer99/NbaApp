//
//  TeamsView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 24/9/22.
//

import SwiftUI

struct TeamsView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = TeamsViewModel()
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .loading:
                LoadingView()
            case .error:
                GenericErrorView(dismiss: dismiss)
            case .received(let teamsPager):
                List {
                    ForEach(teamsPager.getItems()) { team in
                        TeamCardView(title: team.fullname, isPressed: .constant(false))
                    }
                    LoadingFooterView()
                }.listStyle(.plain)
            }
        }.configureNavBar(with: .teams.title.localized, and: dismiss)
            .task { await viewModel.getTeams() }
    }
}

struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView()
    }
}
