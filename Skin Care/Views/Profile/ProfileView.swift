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
                
                HStack  {
                    
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(.leading, 30)
                        .padding(.trailing, 15)
                    
                    VStack (alignment: .leading) {
                        Text("Name")
                            .font(.title2)
                            .fontWeight(.semibold)
                            
                        Text("User Name")
                            .font(.subheadline)
                            .fontWeight(.regular)
                    }
                    
                    Spacer()
                    
                }
                
                Divider()
                    .padding(15)

                HStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 7)
                            .fill(Color.gray.opacity(0.2))
                            .fill(.thinMaterial)
                            .frame(width: 80, height: 60)
                        VStack {
                            Text("2")
                                .font(.headline)
                                .fontWeight(.regular)
                            Text("Routines")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                        }
                    }
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 7)
                            .fill(Color.gray.opacity(0.2))
                            .fill(.thinMaterial)
                            .frame(width: 80, height: 60)
                        VStack {
                            Text("17")
                                .font(.headline)
                                .fontWeight(.regular)
                            Text("Products")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                        }
                    }
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 7)
                            .fill(Color.gray.opacity(0.2))
                            .fill(.thinMaterial)
                            .frame(width: 80, height: 60)
                        VStack {
                            Text("9")
                                .font(.headline)
                                .fontWeight(.regular)
                            Text("WishList")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                        }
                    }
                }
                    
                Divider()
                    .padding(.top, 10)
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.gray.opacity(0.2))
                        .fill(.thinMaterial)
                    VStack{
                        HStack {
    
                            Text("My Skin")
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            ZStack{
                                
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.pink)
                                .frame(width: 120, height: 27)
                                
                            Text("Update Status")
                                    .foregroundStyle(.white)
                                    .font(.callout)
                                    .fontWeight(.semibold)
                            
                            }
                        }
                        .padding(15)
                        .padding(.bottom, -5)
                        
                        Divider()
                            .padding(.leading, 15)
                            .padding(.trailing, 15)
                            .padding(.bottom, 10)
                        
                        
                        Image(systemName: "photo")
                            .resizable()
                            .frame(width: 150, height: 120)
                            
                        
                        Text("Last Picture")
                            .fontWeight(.medium)
                        Text("10/12/2024")
                            .font(.footnote)
                            
                        //continue
                        
                        Spacer()
                        
                        
                    }
                    
                }
                .padding(15)
                
                
                
            }
            .background(AnimatedMeshGradient().edgesIgnoringSafeArea(.all).blur(radius: 7).offset(x: 10, y: 10).opacity(1))
        }
    }
}

#Preview {
    ProfileView()
}
