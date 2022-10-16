//
//  ViewModifier+Extension.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 16/10/22.
//

import SwiftUI

// MARK: - NavBarConfiguration Representable and States
extension NavBarConfiguration {
    struct NavBarRepresentable {
        let title: String
    }
    
    enum NavBarState {
        case idle
        case didTapBack
    }
}

// MARK: - NavBarConfiguration ViewModifier
struct NavBarConfiguration: ViewModifier {
    let representable: NavBarRepresentable
    @Binding var state: NavBarState
    
    func body(content: Content) -> some View {
        content
            .navigationTitle(representable.title)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        state = .didTapBack
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
