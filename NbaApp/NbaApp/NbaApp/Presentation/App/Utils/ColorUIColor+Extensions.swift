//
//  ColorUIColor+Extensions.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 14/10/22.
//

import SwiftUI

extension Color {
    static let customBlack = Color("CustomBlack")
    static let customGray = Color("CustomGray")
    static let customLightGray = Color("CustomLightGray")
}

extension UIColor {
    static let customBlack: UIColor = .init(named: "CustomBlack") ?? .black
    static let customGray: UIColor = .init(named: "CustomGray") ?? .gray
    static let customLightGray: UIColor = .init(named: "CustomLightGray") ?? .lightGray
}
