//
//  LoadingView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 8/10/22.
//

import SwiftUI

struct LoadingView: View {
    // MARK: - Main view
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 15) {
                LottieView(lottieFile: "Loader")
                    .frame(width: 50, height: 50)
                    .padding(.top, 80)
                    .padding(.bottom)
                Text(verbatim: .loading.title.localized)
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                Text(verbatim: .loading.subtitle.localized)
                    .font(.title3)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                Spacer()
            }.frame(width: proxy.size.width, height: proxy.size.height)
        }
    }
}

// MARK: - Canvas preview
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
            .previewLayout(.sizeThatFits)
    }
}
