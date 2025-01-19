//
//  ProfileView.swift
//  Skin Care
//
//  Created by Afonso Camacho on 15/01/2025.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack{
            VStack {
                HStack (){
                    Text("Profile")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    NavigationLink(destination: SettingsView()) {
                                        Image(systemName: "ellipsis.circle.fill")
                                            .font(.title2)
                                            .accentColor(.pink)
                                            .rotationEffect(.degrees(90))
                                    }
                }
                .padding(.leading, 15)
                .padding(.trailing, 10)
                
                
            }
            .background(AnimatedMeshGradient().edgesIgnoringSafeArea(.all).blur(radius: 7).offset(x: 10, y: 10).opacity(1))
        }
    }
}

#Preview {
    ProfileView()
}
