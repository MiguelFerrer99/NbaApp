//
//  LocalizableStrings.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 24/9/22.
//

import UIKit
import SwiftUI

protocol Localizable: CustomStringConvertible {
    var rawValue: String { get }
}

extension Localizable {
    var localized: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }

    var uppercased: String {
        return self.localized.uppercased()
    }

    var description: String {
        return self.localized
    }

    func localized(with: CVarArg...) -> String {
        let text = String(format: self.localized, arguments: with)
        return text
    }
}

extension String {
    enum home: String, Localizable {
        case title = "home_title"
        case teams = "home_teams"
        case players = "home_players"
    }
    
    enum teams: String, Localizable {
        case title = "teams_title"
    }
    
    enum players: String, Localizable {
        case title = "players_title"
    }
    
    enum teamDetail: String, Localizable {
        case abbreviation = "teamDetail_abbreviation"
        case city = "teamDetail_city"
        case conference = "teamDetail_conference"
        case division = "teamDetail_division"
        case fullname = "teamDetail_fullname"
        case name = "teamDetail_name"
    }
    
    enum playerDetail: String, Localizable {
        case firstname = "playerDetail_firstname"
        case lastname = "playerDetail_lastname"
        case position = "playerDetail_position"
        case team = "playerDetail_team"
    }
    
    enum loading: String, Localizable {
        case title = "loading_title"
        case subtitle = "loading_subtitle"
    }
    
    enum genericError: String, Localizable {
        case title = "genericError_title"
        case linkTitle = "genericError_linkTitle"
    }
}
