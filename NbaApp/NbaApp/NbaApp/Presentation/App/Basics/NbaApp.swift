//
//  NbaApp.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 23/9/22.
//

import SwiftUI

@main
struct NbaApp: App {
    // MARK: - Parameters
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    // MARK: - Main view
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
