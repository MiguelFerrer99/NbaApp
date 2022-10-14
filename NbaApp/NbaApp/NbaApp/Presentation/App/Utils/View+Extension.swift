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
    
    func configureNavBar(with title: String, and dismiss: DismissAction) -> some View {
        self
            .navigationTitle(title)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 22, height: 18, alignment: .leading)
                            .foregroundColor(.black)
                    }
                }
            }
    }
    
    func showLoader(_ isLoading: Bool, hideNavBar: Bool = false) -> some View {
        Group {
            if isLoading {
                ZStack {
                    self
                        .toolbar(hideNavBar ? .hidden : .visible, for: .navigationBar)
                        .blur(radius: 20)
                    LoadingView()
                }
            } else {
                self
            }
        }
    }
    
    func showGenericError(_ isGenericError: Bool, _ isPressed: Binding<Bool>) -> some View {
        Group {
            if isGenericError {
                ZStack {
                    self
                    GenericErrorView(isPressed: isPressed)
                }
            } else {
                self
            }
        }
    }
}
