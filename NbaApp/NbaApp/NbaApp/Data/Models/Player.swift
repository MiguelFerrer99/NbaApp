//
//  Player.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 15/10/22.
//

import Foundation

struct Player: Identifiable, Hashable, Equatable {
    let id: String
    let logoUrlString: String
    let firstname: String
    let lastname: String
    let fullname: String
    let position: PlayerPosition
    let team: Team
    
    static func previewInit() -> Player {
        Player(id: "ID",
               logoUrlString: "https://nba-players.herokuapp.com/players/lastname/firstname",
               firstname: "Firstname",
               lastname: "Lastname",
               fullname: "Firstname Lastname",
               position: .c,
               team: .previewInit())
    }
}
