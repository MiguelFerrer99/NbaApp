//
//  Team.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 8/10/22.
//

import Foundation

struct Team: Identifiable, Hashable, Equatable {
    let id: String
    let abbreviation: String
    let city: String
    let conference: String
    let division: String
    let fullname: String
    let name: String
    
    static func previewInit() -> Team {
        Team(id: "ID",
             abbreviation: "Abbreviation",
             city: "City",
             conference: "Conference",
             division: "Division",
             fullname: "Fullname",
             name: "Name")
    }
}
