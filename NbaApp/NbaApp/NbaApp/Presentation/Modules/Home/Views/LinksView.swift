//
//  LinksView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 16/10/22.
//

import SwiftUI

// MARK: - States
enum LinksViewState {
    case idle
    case didTapTopLink
    case didTapBottomLink
}

// MARK: - Main view
struct LinksView: View {
    @State private var topLinkViewState: LinkViewState = .idle
    @State private var bottomLinkViewState: LinkViewState = .idle
    @Binding var state: LinksViewState
    
    var body: some View {
        VStack {
            LinkView(representable: .init(
                title: .home.teams.localized,
                color: .black,
                style: .leftToRight
            ), state: $topLinkViewState)
                .padding(.vertical, 50)
            LinkView(representable: .init(
                title: .home.players.localized,
                color: .black,
                style: .leftToRight
            ), state: $bottomLinkViewState)
            Spacer()
        }
        
        // MARK: - Subviews events listeners
        .onChange(of: topLinkViewState) { _ in didChangeTopLinkViewState() }
        .onChange(of: bottomLinkViewState) { _ in didChangeBottomLinkViewState() }
    }
    
    // MARK: - Subviews events performers
    func didChangeTopLinkViewState() {
        switch topLinkViewState {
        case .idle:
            break
        case .didTap:
            state = .didTapTopLink
        }
    }
    
    func didChangeBottomLinkViewState() {
        switch bottomLinkViewState {
        case .idle:
            break
        case .didTap:
            state = .didTapBottomLink
        }
    }
}

// MARK: - Canvas preview
struct LinksView_Previews: PreviewProvider {
    static var previews: some View {
        LinksView(state: .constant(.idle))
            .previewLayout(.sizeThatFits)
    }
}
