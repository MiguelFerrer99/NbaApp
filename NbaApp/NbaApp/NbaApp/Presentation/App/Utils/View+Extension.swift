//
//  View+Extension.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 8/10/22.
//

import SwiftUI

extension View {
    func embedInNavigation(with title: String) -> some View {
        NavigationStack {
            self
                .navigationTitle(title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func onLoad(perform action: (() -> Void)? = nil) -> some View {
        modifier(ViewDidLoadModifier(perform: action))
    }
}
