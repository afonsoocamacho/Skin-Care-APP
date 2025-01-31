//
//  HomeView.swift
//  Skin Care
//
//  Created by Afonso Camacho on 15/01/2025.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            AnimatedMeshGradient()
                .ignoresSafeArea()
            
            VStack{
                
                Text("My Skin Care")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.thinMaterial)
                    
                    VStack{
                        
                        HStack {
                            
                            Text("Start a \nRoutine")
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.leading)
                            
                            
                            Spacer()
                            
                        }
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        
                        Spacer()
                        
                        HStack{
                            
                            Spacer()
                            
                            Image(systemName: "play.circle.fill")
                                .font(.title)
                            
                        }
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        
                    }
                    
                    
                    
                    
                    
                }
                .frame(width: 200, height: 200)
                
                    
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    HomeView()
}
