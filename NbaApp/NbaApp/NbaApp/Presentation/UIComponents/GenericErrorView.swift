//
//  GenericErrorView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 14/10/22.
//

import SwiftUI

// MARK: - States
enum GenericErrorViewState {
    case idle
    case didTapLink
}

// MARK: - Main view
struct GenericErrorView: View {
    @State private var linkViewState: LinkViewState = .idle
    @Binding var state: GenericErrorViewState
    
    var body: some View {
        GeometryReader { _ in
            VStack(spacing: 30) {
                Image("GenericError")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text(verbatim: .genericError.title.localized)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                Spacer().frame(height: 20)
                LinkView(representable: .init(title: .genericError.linkTitle.localized, color: .white, style: .rightToLeft), state: $linkViewState)
            }.padding(.vertical, 50)
            .padding(.horizontal)
            .background { Color.customBlack }
            .cornerRadius(15)
            .shadow(color: .customBlack, radius: 15, x: 0, y: 10)
            .padding([.leading, .trailing, .bottom], 40)
            .padding(.top, 10)
        }
        
        // MARK: - Subviews events listeners
        .onChange(of: linkViewState) { _ in didChangeLinkViewState() }
    }
    
    // MARK: - Subviews events performers
    func didChangeLinkViewState() {
        switch linkViewState {
        case .idle:
            break
        case .didTap:
            state = .didTapLink
        }
    }
}

// MARK: - Canvas preview
struct GenericErrorView_Previews: PreviewProvider {
    static var previews: some View {
        GenericErrorView(state: .constant(.idle))
            .previewLayout(.sizeThatFits)
    }
}
