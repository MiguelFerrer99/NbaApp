//
//  PlayersRepresentables.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 16/10/22.
//

import SwiftUI

struct PlayersViewReceivedRepresentable {
    let pager: Pagination<Player>
}

struct PlayersListViewRepresentable {
    let pager: Pagination<Player>
}

struct PlayerCardViewRepresentable {
    let title: String
    
    @Binding var isPressed: Bool
}
