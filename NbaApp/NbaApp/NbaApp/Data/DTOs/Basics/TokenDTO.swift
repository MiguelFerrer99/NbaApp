//
//  TokenDTO.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 8/10/22.
//

import Foundation

struct TokenDTO: Codable {
    let accessToken: String
    let refreshToken: String
    let expiresIn: Int
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
        case expiresIn = "expires_in"
    }
}
