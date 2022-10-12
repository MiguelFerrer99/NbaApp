//
//  UserDTO.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 8/10/22.
//

import Foundation

struct UserDTO: Decodable {
    let id: String
    let firstName: String
    let lastName: String
    let email: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case email = "email"
    }
    
    func toBO() -> User {
        return User(id: id,
                    firstName: firstName,
                    lastName: lastName,
                    email: email)
    }
}
