//
//  TeamDTO.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 8/10/22.
//

import Foundation

struct TeamDTO: Decodable {
    let id: Int
    let abbreviation: String
    let city: String
    let conference: String
    let division: String
    let full_name: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case abbreviation = "abbreviation"
        case city = "city"
        case conference = "conference"
        case division = "division"
        case full_name = "full_name"
        case name = "name"
    }
    
    func toBO() -> Team {
        return Team(id: "\(id)",
                    abbreviation: abbreviation,
                    city: city,
                    conference: conference,
                    division: division,
                    fullname: full_name,
                    name: name)
    }
}
