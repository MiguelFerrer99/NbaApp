//
//  PlayersView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 24/9/22.
//

import SwiftUI

struct PlayersView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isLoading = true
    
    var body: some View {
        VStack {
            EmptyView()
        }
        .configureNavBar(with: .players.title.localized, and: dismiss)
        .showLoader(isLoading)
    }
}

struct PlayersView_Previews: PreviewProvider {
    static var previews: some View {
        PlayersView()
    }
}
