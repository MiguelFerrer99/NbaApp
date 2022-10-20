//
//  PlayerDetailView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 20/10/22.
//

import SwiftUI

// MARK: - Representables
struct PlayerDetailViewRepresentable {
    let player: Player
}

// MARK: - Main view
struct PlayerDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var didTapNavBarBackButton = false
    let representable: PlayerDetailViewRepresentable
    
    var body: some View {
        EmptyView()
            .modifier(NavBarConfiguration(representable: .init(title: "\(representable.player.firstname) \(representable.player.lastname)"), didTapBackButton: $didTapNavBarBackButton))
            
        // MARK: - Subviews events listeners
        .onChange(of: didTapNavBarBackButton) { _ in dismiss() }
    }
}

// MARK: - Canvas preview
struct PlayerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerDetailView(representable: .init(player: .previewInit()))
    }
}
