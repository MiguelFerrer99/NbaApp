//
//  Player.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 15/10/22.
//

import Foundation

struct Player: Identifiable, Hashable, Equatable {
    let id: String
    let firstname: String
    let lastname: String
    let position: PlayerPosition
    let team: Team
    var fullname: String { firstname + " " + lastname }
    
    static func previewInit() -> Player {
        Player(id: "ID",
               firstname: "Firstname",
               lastname: "Lastname",
               position: .c,
               team: .previewInit())
    }
}
