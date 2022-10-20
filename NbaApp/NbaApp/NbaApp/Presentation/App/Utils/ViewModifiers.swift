//
//  ViewModifier+Extension.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 16/10/22.
//

import SwiftUI

struct NavBarConfiguration: ViewModifier {
    struct NavBarRepresentable {
        let title: String
    }
    
    let representable: NavBarRepresentable
    @Binding var didTapBackButton: Bool
    
    func body(content: Content) -> some View {
        content
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
                ToolbarItem(placement: .principal) {
                    Text(representable.title)
                        .bold()
                }
            }
    }
}

struct ViewDidLoadModifier: ViewModifier {
    @State private var didLoad = false
    private let action: (() -> Void)?
    
    init(perform action: (() -> Void)? = nil) {
        self.action = action
    }
    
    func body(content: Content) -> some View {
        content.onAppear {
            if didLoad == false {
                didLoad = true
                action?()
            }
        }
    }
}
