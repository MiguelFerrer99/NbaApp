//
//  Teams.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 8/10/22.
//

import Foundation

enum TeamsEndpoint {
    case getAllTeams(page: Int)
    
    var endpoint: Endpoint {
        get {
            switch self {
            case .getAllTeams(let page):
                return Endpoint(path: "/teams?page=\(page)",
                                httpMethod: .get,
                                headers: ["X-RapidAPI-Key": Configuration.shared.API_KEY,
                                          "X-RapidAPI-Host": Configuration.shared.API_HOST])
            }
        }
    }
}
