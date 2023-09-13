//  PlanetApp.swift
//  Planet
//  Created by Naleesh Jeffrey on 2023-09-13.

import SwiftUI

@main
struct PlanetApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .environmentObject(PlanetStore())
            }
        }
    }
}
