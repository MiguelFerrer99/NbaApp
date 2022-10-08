//
//  TeamsView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 24/9/22.
//

import SwiftUI

struct TeamsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isLoading = true
    @GestureState private var dragOffset = CGSize.zero
    
    var body: some View {
        VStack {
            EmptyView()
        }
        .configureNavBar(with: .teams.title.localized, and: dismiss)
        .isLoading(isLoading)
    }
}

struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView()
    }
}
