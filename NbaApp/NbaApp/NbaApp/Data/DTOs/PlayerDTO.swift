//
//  PlayerDTO.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 15/10/22.
//

import Foundation

enum PlayerPosition: String, Decodable {
    case c = "C"
    case g = "G"
    case f = "F"
    case cf = "C-F"
    case fc = "F-C"
    case gf = "G-F"
    case none = ""
}

struct PlayerDTO: Decodable {
    let id: Int
    let first_name: String
    let last_name: String
    let position: PlayerPosition
    let teamDTO: TeamDTO
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case first_name = "first_name"
        case last_name = "last_name"
        case position = "position"
        case teamDTO = "team"
    }
    
    func toBO() -> Player {
        return Player(id: "\(id)",
                      firstname: first_name,
                      lastname: last_name,
                      position: position,
                      team: teamDTO.toBO())
    }
}
