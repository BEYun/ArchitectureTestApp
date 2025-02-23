//
//  ArchitectureTestAppApp.swift
//  ArchitectureTestApp
//
//  Created by Yun on 2/18/25.
//

import SwiftUI

@main
struct ArchitectureTestApp: App {
    var isAdmin: Bool = false
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
