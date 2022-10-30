//
//  GenericErrorView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 14/10/22.
//

import SwiftUI

struct GenericErrorView: View {
    // MARK: - Parameters
    @State private var didTapLink = false
    @Binding var isPresented: Bool
    
    // MARK: - Main view
    var body: some View {
        VStack {
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
            .frame(width: 300)
            .padding([.leading, .trailing, .bottom], 40)
            .padding(.top, 10)
            Spacer()
        }
        
        // MARK: - Subviews events listeners
        .onChange(of: didTapLink) { _ in isPresented = false }
    }
}

// MARK: - Canvas preview
struct GenericErrorView_Previews: PreviewProvider {
    static var previews: some View {
        GenericErrorView(isPresented: .constant(true))
            .previewLayout(.sizeThatFits)
    }
}
