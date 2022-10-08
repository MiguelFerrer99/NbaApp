//
//  ErrorDTO.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 8/10/22.
//

import Foundation

struct ErrorDTO: Codable {
    let code: String
    
    enum CodingKeys: String, CodingKey {
        case code = "code"
    }
}
