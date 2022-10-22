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

struct TeamDetailView: View {
    // MARK: - Parameters
    let representable: TeamDetailViewRepresentable
    @Environment(\.dismiss) private var dismiss
    @State private var didTapNavBarBackButton = false
    
    // MARK: - Main view
    var body: some View {
        VStack(spacing: 40) {
            Circle()
                .foregroundColor(.customGray)
                .frame(width: 150, height: 150)
                .padding(.horizontal)
            VStack(spacing: 20) {
                HorizontalInfoView(representable: .init(
                    titleLeft: .teamDetail.abbreviation.localized,
                    titleRight: representable.team.abbreviation))
                HorizontalInfoView(representable: .init(
                    titleLeft: .teamDetail.city.localized,
                    titleRight: representable.team.city))
                HorizontalInfoView(representable: .init(
                    titleLeft: .teamDetail.conference.localized,
                    titleRight: representable.team.conference))
                HorizontalInfoView(representable: .init(
                    titleLeft: .teamDetail.division.localized,
                    titleRight: representable.team.division))
                HorizontalInfoView(representable: .init(
                    titleLeft: .teamDetail.fullname.localized,
                    titleRight: representable.team.fullname))
                HorizontalInfoView(representable: .init(
                    titleLeft: .teamDetail.name.localized,
                    titleRight: representable.team.name))
            }
            Spacer()
        }.padding(30)
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
