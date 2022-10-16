//
//  GenericErrorView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 14/10/22.
//

import SwiftUI

struct GenericErrorView: View {
    let dismiss: DismissAction?
    
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
                LinkView(title: .genericError.linkTitle.localized, color: .white, style: .rightToLeft, dismiss: dismiss, isPressed: .constant(false))
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

struct GenericErrorView_Previews: PreviewProvider {
    static var previews: some View {
        GenericErrorView(dismiss: nil)
            .previewLayout(.sizeThatFits)
    }
}
