//
//  View+Extension.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 8/10/22.
//

import SwiftUI

struct NavBarConfigRepresentable {
    let title: String
}

extension View {
    func embedInNavigation(with representable: NavBarConfigRepresentable) -> some View {
        NavigationStack {
            self
                .configureNavBar(with: representable)
        }
    }
    
    func configureNavBar(with representable: NavBarConfigRepresentable) -> some View {
        self
            .navigationTitle(representable.title)
            .navigationBarTitleDisplayMode(.inline)
    }
    
    func onLoad(perform action: @escaping (() -> Void)) -> some View {
        self
            .modifier(ViewDidLoadModifier(perform: action))
    }
    
    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            EmptyView()
        } else {
            self
        }
    }
}
