//
//  User.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 8/10/22.
//

import Foundation

struct User {
    static var me: User?
    
    let id: String
    let firstName: String
    let lastName: String
    let email: String
}
