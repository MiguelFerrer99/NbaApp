//
//  HomeViewModel.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 16/10/22.
//

import SwiftUI

// MARK: - States
enum HomeState {
    case idle
}

// MARK: - ViewModel
@MainActor class HomeViewModel: ObservableObject {
    @Published private(set) var state: HomeState = .idle
}
