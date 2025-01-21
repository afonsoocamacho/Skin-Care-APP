//
//  Skin_CareApp.swift
//  Skin Care
//
//  Created by Afonso Camacho on 14/01/2025.
//

import SwiftUI
import SwiftData

@main
struct Skin_CareApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Product.self])
    }
}
