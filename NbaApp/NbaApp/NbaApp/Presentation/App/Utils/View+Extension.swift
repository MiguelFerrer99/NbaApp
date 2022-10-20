//
//  View+Extension.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 8/10/22.
//

import SwiftUI

struct NavBarRepresentable {
    let title: String
}

extension View {
    func embedInNavigation(with title: String) -> some View {
        NavigationStack {
            self
                .navigationTitle(title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func configureNavBar(with representable: NavBarRepresentable, and didTapBackButton: Binding<Bool>) -> some View {
        self
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        didTapBackButton.wrappedValue = true
                    } label: {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 22, height: 18, alignment: .leading)
                            .foregroundColor(.black)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text(representable.title)
                        .bold()
                }
            }
    }
    
    func onLoad(perform action: (() -> Void)? = nil) -> some View {
        self
            .modifier(ViewDidLoadModifier(perform: action))
    }
}
