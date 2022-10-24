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
    var logo: String {
        let safeLastname = (lastname.components(separatedBy: .whitespaces).first ?? "").lowercased()
        let safeFirstname = (firstname.components(separatedBy: .whitespaces).first ?? "").lowercased()
        let safeLogo = "https://nba-players.herokuapp.com/players/\(safeLastname)/\(safeFirstname)"
        return safeLogo
    }
    
    static func previewInit() -> Player {
        Player(id: "ID",
               firstname: "Firstname",
               lastname: "Lastname",
               position: .c,
               team: .previewInit())
    }
}
