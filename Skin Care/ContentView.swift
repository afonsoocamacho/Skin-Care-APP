//
//  ContentView.swift
//  Skin Care
//
//  Created by Afonso Camacho on 14/01/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab: Int = 0
    
   // init() {
            // Set a blur effect for the Tab Bar
     //       let blurEffect = UIBlurEffect(style: .systemUltraThinMaterial)
     //       let blurEffectView = UIVisualEffectView(effect: blurEffect)
     //       blurEffectView.frame = UITabBar.appearance().bounds
     //       UITabBar.appearance().backgroundImage = UIImage() // Remove default background
     //       UITabBar.appearance().shadowImage = UIImage() // Remove shadow
      //      UITabBar.appearance().insertSubview(blurEffectView, at: 0) // Add blur effect
     //   }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                        .environment(\.symbolVariants, .none)
                }
                .tag(0)
            RoutinesView()
                .tabItem {
                    Image(systemName: selectedTab == 1 ? "clock.fill" : "clock")
                        .environment(\.symbolVariants, .none)
                }
                .tag(1)
            ProductsView()
                .tabItem {
                    Image(systemName: selectedTab == 2 ? "seal.fill" : "seal")
                        .environment(\.symbolVariants, .none)
                }
                .tag(2)
            ProfileView()
                .tabItem {
                    Image(systemName: selectedTab == 3 ? "person.fill" : "person")
                        .environment(\.symbolVariants, .none)
                }
                .tag(3)
        }
        .accentColor(.teal)
        .toolbarBackground(.ultraThinMaterial, for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
    }
}

#Preview {
    ContentView()
}
