//
//  Player.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 15/10/22.
//

import Foundation

struct Player: Identifiable {
    let id: String
    let firstname: String
    let lastname: String
    let position: PlayerPosition
    let team: Team
    
    static func previewInit() -> Player {
        Player(id: "ID",
               firstname: "Firstname",
               lastname: "Lastname",
               position: .c,
               team: .previewInit())
    }
}
