//
//  View+Extension.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 8/10/22.
//

import SwiftUI

extension View {
    func embedInNavigation(with title: String) -> some View {
        CustomNavigationView(title: title) {
            self
        }
    }
    
    func navigateToDestination<V>(if isPresented: Binding<Bool>, destination: () -> V) -> some View where V : View {
        if #available(iOS 16.0, *) {
            return self
                .navigationDestination(isPresented: isPresented, destination: destination)
        } else {
            return VStack {
                self
                NavigationLink(isActive: isPresented, destination: destination) { EmptyView() }
            }
        }
    }
}
