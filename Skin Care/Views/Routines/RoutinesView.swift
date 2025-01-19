//
//  RoutinesView.swift
//  Skin Care
//
//  Created by Afonso Camacho on 15/01/2025.
//

import SwiftUI

struct RoutinesView: View {
    var body: some View {
        VStack {
            HStack (){
                Text("My Rouines")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                Button(action: {
                    print("Add Routine")
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                        .accentColor(.pink)
                }
            }
            .padding(.leading, 15)
            .padding(.trailing, 10)
            
            VStack{
                Text("Filters and search bar")
                //search bar
                //fiter options
                //archived??
            }
            .padding(.top, 5)
            
            ScrollView{
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.gray.opacity(0.2))
                        .fill(.thickMaterial)
                    
                    HStack{
                        VStack (alignment: .leading){
                            Text("Morning Routine")
                                .font(.title3)
                                .fontWeight(.bold)
                            Text("9 Steps")
                                .font(.subheadline)
                            HStack{
                                Circle()
                                    .fill(Color.green)
                                    .frame(width: 20, height: 20)
                                Circle()
                                    .fill(Color.pink)
                                    .frame(width: 20, height: 20)
                                    .offset(x:-20)
                                Circle()
                                    .fill(Color.blue)
                                    .frame(width: 20, height: 20)
                                    .offset(x:-40)
                                Circle()
                                    .fill(Color.yellow)
                                    .frame(width: 20, height: 20)
                                    .offset(x:-57)
                                Circle()
                                    .fill(Color.orange)
                                    .frame(width: 20, height: 20)
                                    .offset(x:-75)
                                Text("+4")
                                    .font(.footnote)
                                    .offset(x:-80)
                                    .opacity(0.35)
                                    
                            }
                            
                                
                                
                        }
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .font(.title)
                    }
                    .padding(15)
                }
                .frame(height: 100)
                .padding(10)
                    
            }
        }
        .background(AnimatedMeshGradient().edgesIgnoringSafeArea(.all).blur(radius: 7).offset(x: 10, y: 10).opacity(1))
    }
}

#Preview {
    RoutinesView()
}
