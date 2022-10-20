//
//  Team.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 8/10/22.
//

import Foundation

struct Team: Identifiable, Equatable {
    let id: String
    let abbreviation: String
    let city: String
    let conference: String
    let division: String
    let fullname: String
    let name: String
    
    func isLast(of teams: [Team]) -> Bool {
        self == teams.last
    }
    
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
