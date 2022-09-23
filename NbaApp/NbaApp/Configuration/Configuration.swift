//
//  Configuration.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 23/9/22.
//

import Foundation
import SwiftUI

final class Configuration {
    static let shared = Configuration()
    
    let CLIENT_ID: String
    let CLIENT_SECRET: String
    let BASE_URL: String
    
    init() {
        CLIENT_ID = Bundle.main.object(forInfoDictionaryKey: "CLIENT_ID") as! String
        CLIENT_SECRET = Bundle.main.object(forInfoDictionaryKey: "CLIENT_SECRET") as! String
        BASE_URL = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as! String
    }
}
