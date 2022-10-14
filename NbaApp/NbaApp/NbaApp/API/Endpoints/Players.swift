//
//  Players.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 8/10/22.
//

import Foundation

enum PlayersEndpoint {
    case getPlayers(page: Int)
    
    var endpoint: Endpoint {
        get {
            switch self {
            case .getPlayers(let page):
                return Endpoint(path: "/players?page=\(page)",
                                httpMethod: .get,
                                headers: ["X-RapidAPI-Key": Configuration.shared.API_KEY,
                                          "X-RapidAPI-Host": Configuration.shared.API_HOST],
                                mock: "Players")
            }
        }
    }
}
