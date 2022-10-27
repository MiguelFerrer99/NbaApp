//
//  AppDelegate.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 27/10/22.
//

import UIKit
import IQKeyboardManagerSwift

final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        IQKeyboardManager.shared.enable = true
        return true
    }
}
