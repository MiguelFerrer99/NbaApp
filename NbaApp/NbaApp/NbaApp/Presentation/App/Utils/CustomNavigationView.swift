//
//  CustomNavigationView.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 18/10/22.
//

import SwiftUI

struct CustomNavigationView<Content: View>: View {
    let title: String
    @ViewBuilder var content: Content
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                content
                    .navigationTitle(title)
                    .navigationBarTitleDisplayMode(.inline)
            }
        } else {
            NavigationView {
                content
                    .navigationTitle(title)
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
