//
//  LoadingView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 8/10/22.
//

import SwiftUI
import Lottie

struct LoadingView: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 35) {
                Spacer().frame(height: 100)
                LottieView(lottieFile: "Loader")
                    .frame(width: 50, height: 50)
                Text(verbatim: title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                Text(verbatim: subtitle)
                    .font(.title3)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                Spacer()
            }.frame(width: proxy.size.width, height: proxy.size.height)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(title: "Title", subtitle: "Subtitle")
            .previewLayout(.sizeThatFits)
    }
}
