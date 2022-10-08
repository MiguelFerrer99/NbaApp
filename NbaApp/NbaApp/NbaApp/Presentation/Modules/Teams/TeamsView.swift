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
            EmptyView()
        }
        .configureNavBar(with: .teams.title.localized, and: dismiss)
        .showLoader(viewModel.isLoading)
        .task { await viewModel.getAllTeams() }
    }
}

struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView()
    }
}
