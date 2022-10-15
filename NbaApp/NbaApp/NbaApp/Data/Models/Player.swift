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
    var fullname: String { "\(firstname) \(lastname)" }
}
