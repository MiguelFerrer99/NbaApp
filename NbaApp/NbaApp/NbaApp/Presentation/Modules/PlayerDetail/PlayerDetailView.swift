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
    @State private var didTapTeamLinkView = false
    
    // MARK: - Main view
    var body: some View {
        VStack(spacing: 40) {
            CustomAsyncImage(representable: .init(
                itemID: representable.player.id,
                fullname: representable.player.fullname,
                urlString: representable.player.logoUrlString,
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
                    titleRight: representable.player.position.description))
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
        .configureNavBar(with: .init(title: representable.player.fullname))
        
        // MARK: - Navigation destinations
        .navigationDestination(isPresented: $didTapTeamLinkView, destination: {
            TeamDetailView(representable: .init(team: representable.player.team))
        })
    }
}

// MARK: - Canvas preview
struct PlayerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerDetailView(representable: .init(player: .previewInit()))
    }
}
