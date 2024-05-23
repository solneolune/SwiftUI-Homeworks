//
//  AnegdotebiApp.swift
//  Anegdotebi
//
//  Created by Barbare Tepnadze on 22.05.24.
//

import SwiftUI

@main
struct AnegdotebiApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
