//
//  LocalizableStrings.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 24/9/22.
//

import UIKit

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
    enum common: String, Localizable {
        case example = "common_example"
    }
}
