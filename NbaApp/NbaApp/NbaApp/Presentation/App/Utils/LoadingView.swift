//
//  LoadingView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 8/10/22.
//

import SwiftUI
import Lottie

struct LoadingView: View {
    let isLoading: Bool
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 35) {
                Spacer().frame(height: 100)
                LottieView(lottieFile: "Loader")
                    .frame(width: 50, height: 50)
                Text(verbatim: .loading.title.localized)
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                Text(verbatim: .loading.subtitle.localized)
                    .font(.title3)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                Spacer()
            }.frame(width: proxy.size.width, height: proxy.size.height)
        }.opacity(isLoading ? 1 : 0)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isLoading: false)
            .previewLayout(.sizeThatFits)
    }
}
