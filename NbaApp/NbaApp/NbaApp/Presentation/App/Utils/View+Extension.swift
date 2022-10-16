//
//  View+Extension.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 8/10/22.
//

import SwiftUI

extension View {
    func embedInNavigationStack(with title: String) -> some View {
        NavigationStack {
            self
                .navigationTitle(title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
