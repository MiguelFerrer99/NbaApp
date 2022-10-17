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
    let representable: TeamDetailViewRepresentable
    
    var body: some View {
        Text(representable.team.fullname)
    }
}

// MARK: - Canvas preview
struct TeamDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TeamDetailView(representable: .init(team: .previewInit()))
    }
}
