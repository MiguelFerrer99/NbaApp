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

struct PlayerDetailView: View {
    // MARK: - Parameters
    let representable: PlayerDetailViewRepresentable
    @Environment(\.dismiss) private var dismiss
    @State private var didTapNavBarBackButton = false
    @State private var didTapTeamLinkView = false
    
    // MARK: - Main view
    var body: some View {
        VStack(spacing: 40) {
            CustomAsyncImage(representable: .init(
                fullname: representable.player.fullname,
                urlString: representable.player.logo,
                style: .big))
            VStack(spacing: 20) {
                HorizontalInfoView(representable: .init(
                    titleLeft: .playerDetail.firstname.localized,
                    titleRight: representable.player.firstname))
                HorizontalInfoView(representable: .init(
                    titleLeft: .playerDetail.lastname.localized,
                    titleRight: representable.player.lastname))
                HorizontalInfoView(representable: .init(
                    titleLeft: .playerDetail.position.localized,
                    titleRight: representable.player.position.rawValue))
                HorizontalInfoView(representable: .init(
                    titleLeft: .playerDetail.team.localized,
                    titleRight: representable.player.team.name))
                LinkView(representable: .init(
                    title: representable.player.team.fullname,
                    color: .customBlack,
                    style: .leftToRight), isPressed: $didTapTeamLinkView)
                .padding(.top, 30)
                .padding(.horizontal)
            }
            Spacer()
        }.padding(30)
        .configureNavBar(with: .init(title: representable.player.fullname), and: $didTapNavBarBackButton)
        
        // MARK: - Navigation destinations
        .navigationDestination(isPresented: $didTapTeamLinkView, destination: { TeamDetailView(representable: .init(team: representable.player.team)) })
            
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
