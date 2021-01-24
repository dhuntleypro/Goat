//
//  GoatApp.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI

@main
struct GoatApp: App {
    
    
    
    init() {
        // Tab bar
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().backgroundColor = .black
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        UITabBar.appearance().tintColor = .white
    }
    
    
    var body: some Scene {

        WindowGroup {
            ContentView()
        }
    }
}
