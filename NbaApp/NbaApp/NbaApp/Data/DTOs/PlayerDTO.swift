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
    case unknown = ""
    
    var description: String {
        switch self {
        case .c: return .playerDetail.positions.c.localized
        case .g: return .playerDetail.positions.g.localized
        case .f: return .playerDetail.positions.f.localized
        case .cf: return .playerDetail.positions.cf.localized
        case .fc: return .playerDetail.positions.fc.localized
        case .gf: return .playerDetail.positions.gf.localized
        case .unknown: return .playerDetail.positions.unknown.localized
        }
    }
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
        let safeLastname = getSafeLastname()
        return Player(id: "\(id)",
                      logoUrlString: getLogoUrlString(),
                      firstname: first_name,
                      lastname: safeLastname,
                      fullname: first_name + " " + safeLastname,
                      position: position,
                      team: teamDTO.toBO())
    }
    
    private func getLogoUrlString() -> String {
        let safeLastname = (last_name.components(separatedBy: .whitespaces).first ?? "").lowercased()
        let safeFirstname = (first_name.components(separatedBy: .whitespaces).first ?? "").lowercased()
        let safeLogoUrlString = "https://nba-players.herokuapp.com/players/\(safeLastname)/\(safeFirstname)"
        return safeLogoUrlString
    }
    
    private func getSafeLastname() -> String {
        let safeLastname = (last_name.components(separatedBy: .whitespaces).first ?? last_name)
        return safeLastname
    }
}
