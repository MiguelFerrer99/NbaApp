//
//  HomeViewModel.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 16/10/22.
//

import SwiftUI

enum HomeState {
    case idle
}

@MainActor class HomeViewModel: ObservableObject {
    private var teamsPager = Pagination<Team>()
    
    @Published private(set) var state: HomeState = .idle
}
