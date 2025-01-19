//
//  SettingsView.swift
//  Skin Care
//
//  Created by Afonso Camacho on 19/01/2025.
//

import SwiftUI

struct SettingsView: View {
    
    private var appVersion: String {
            Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "N/A"
        }
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    Section(header: Text("App Settings")){
                        Toggle("Notifications", isOn: .constant(true))
                        Toggle("Dark Mode", isOn: .constant(false))
                    }
                }
                .scrollContentBackground(.hidden)
                .background(.ultraThinMaterial)
                
                Spacer()
                
                Text("Version \(appVersion) ")
                    .font(.callout)
                    .foregroundColor(.gray)
            }
                
            
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            
        
    }
}

#Preview {
    SettingsView()
}
