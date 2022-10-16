//
//  LoadingFooterView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 16/10/22.
//

import SwiftUI

struct LoadingFooterView: View {
    var body: some View {
        LottieView(lottieFile: "Loader")
            .frame(height: 40)
            .padding(.top)
            .listRowSeparator(.hidden)
    }
}

struct LoadingFooterView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingFooterView()
    }
}
