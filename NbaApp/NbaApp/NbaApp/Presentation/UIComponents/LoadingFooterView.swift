//
//  LoadingFooterView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 16/10/22.
//

import SwiftUI

struct LoadingFooterView: View {
    // MARK: - Main view
    var body: some View {
        LottieView(lottieFile: "Loader")
            .frame(height: 40)
            .padding(.vertical)
            .listRowSeparator(.hidden)
    }
}

// MARK: - Canvas preview
struct LoadingFooterView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingFooterView()
            .previewLayout(.sizeThatFits)
    }
}
