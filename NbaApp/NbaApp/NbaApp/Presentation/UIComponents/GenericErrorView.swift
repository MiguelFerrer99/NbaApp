//
//  GenericErrorView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 14/10/22.
//

import SwiftUI

// MARK: - Main view
struct GenericErrorView: View {
    @Binding var didTapLink: Bool
    
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
                    .padding(.bottom)
                LinkView(representable: .init(title: .genericError.linkTitle.localized, color: .white, style: .rightToLeft), isPressed: $didTapLink)
            }.padding(.vertical, 50)
            .padding(.horizontal)
            .background { Color.customBlack }
            .cornerRadius(15)
            .shadow(color: .customBlack, radius: 15, x: 0, y: 10)
            .padding([.leading, .trailing, .bottom], 40)
            .padding(.top, 10)
        }
    }
}

// MARK: - Canvas preview
struct GenericErrorView_Previews: PreviewProvider {
    static var previews: some View {
        GenericErrorView(didTapLink: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
