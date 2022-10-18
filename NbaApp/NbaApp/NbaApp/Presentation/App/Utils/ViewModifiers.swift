//
//  ViewModifier+Extension.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 16/10/22.
//

import SwiftUI

// MARK: - NavBarConfiguration Representable
extension NavBarConfiguration {
    struct NavBarRepresentable {
        let title: String
    }
}

// MARK: - NavBarConfiguration ViewModifier
struct NavBarConfiguration: ViewModifier {
    let representable: NavBarRepresentable
    @Binding var didTapBackButton: Bool
    
    func body(content: Content) -> some View {
        content
            .navigationTitle(representable.title)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        didTapBackButton = true
                    } label: {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 22, height: 18, alignment: .leading)
                            .foregroundColor(.black)
                    }
                }
            }
    }
}
