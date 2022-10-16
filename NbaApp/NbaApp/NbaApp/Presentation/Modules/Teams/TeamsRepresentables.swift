//
//  TeamsRepresentables.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 16/10/22.
//

import SwiftUI

struct TeamsViewReceivedRepresentable {
    let pager: Pagination<Team>
}

struct TeamsListViewRepresentable {
    let pager: Pagination<Team>
}

struct TeamCardViewRepresentable {
    let title: String
    
    @Binding var isPressed: Bool
}
