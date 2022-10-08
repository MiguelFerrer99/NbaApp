//
//  PlayersViewModel.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 8/10/22.
//

import SwiftUI

@MainActor class PlayersViewModel: ObservableObject {
    @Published var isLoading = true
    
    func hideLoaderWithDelay() async {
        Task {
            try await Task.sleep(nanoseconds: 3000000000)
            isLoading = false
        }
    }
}
