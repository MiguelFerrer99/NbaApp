//
//  TeamDetailView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 16/10/22.
//

import SwiftUI

// MARK: - Representables
struct TeamDetailViewRepresentable {
    let team: Team
}

// MARK: - Main view
struct TeamDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var didTapNavBarBackButton = false
    let representable: TeamDetailViewRepresentable
    
    var body: some View {
        EmptyView()
            .configureNavBar(with: .init(title: representable.team.fullname), and: $didTapNavBarBackButton)
            
        // MARK: - Subviews events listeners
        .onChange(of: didTapNavBarBackButton) { _ in dismiss() }
    }
}

// MARK: - Canvas preview
struct TeamDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TeamDetailView(representable: .init(team: .previewInit()))
    }
}
