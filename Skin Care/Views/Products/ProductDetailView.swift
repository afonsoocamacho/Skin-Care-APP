//
//  ProductDetailView.swift
//  Skin Care
//
//  Created by Afonso Camacho on 22/01/2025.
//

import SwiftUI

struct ProductDetailView: View {
    
    //@State var product: Product
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(colors: [.pink, .white], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack{
                    
                    Spacer(minLength: 30)
                    
                    Text("Product Name")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 3)
                    
                    HStack{
                        Text("Type")
                        Text("·")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Brand")
                    }
                    .foregroundColor(Color.white)
                    .padding(0)
                    
                    Text("Status")
                        .foregroundColor(Color.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 15)
                        .background(
                            RoundedRectangle(cornerRadius: 30)
                                //.fill(.green.opacity(0.2))
                                .fill(.ultraThinMaterial) )
                    
                    Spacer(minLength: 10)
                    ScrollView{
                        VStack{
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.white)
                                    .frame(width: .infinity, height: 320)
                                VStack{
                                    
                                HStack{
                                    Spacer()
                                    Button(action: {
                                        print("Added to favorites Product")
                                    }) {
                                        Image(systemName: "heart")
                                            .font(.title2)
                                            .accentColor(.pink)
                                            .padding(.top, 15)
                                            .padding(.trailing, 15)
                                    }
                                    }
                                    Spacer()
                                }
                            }
                            .padding(.bottom, 10)
                        
                        
                        VStack (alignment: .leading){
                            
                            Text("Instructions")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .padding(.bottom, 5)
                            
                            Text("How to use this product will go here probably will be a big space, to have all the instructions of how  to use. ")
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 5)
                            
                            Divider()
                            
                        VStack (alignment: .leading){
                            
                            Text("Ingredients")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .padding(.bottom, 5)
                            
                            Text("How to use this product will go here probably will be a big space, to have all the instructions of how  to use. ")
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 5)
                        
                            Divider()
                            HStack{
                                VStack (alignment: .leading){
                                    
                                    Text("Open Date")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .padding(.bottom, 5)
                                    
                                    Text("12/12/2025")
                                }
                                .padding(.vertical, 10)
                                .padding(.horizontal, 5)
                                
                                Divider()
                                
                                VStack (alignment: .leading){
                                    
                                    Text("Open Date")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .padding(.bottom, 5)
                                    
                                    Text("12/12/2025")
                                }
                                .padding(.vertical, 10)
                                .padding(.horizontal, 5)
                            }
                        }
                        .padding(25)
                        .background(
                            RoundedRectangle(cornerRadius: 30)
                                //.fill(.green.opacity(0.2))
                                .fill(.ultraThinMaterial) )
                        
                        
                        VStack {
                            Text("Last used: 22/01/2025")
                                .font(.subheadline)
                            Text("Last updated: 22/01/2025")
                                .font(.subheadline)
                            Text("Created at: 22/01/2025")
                                .font(.subheadline)
                        }
                        .padding(.vertical, 20)
                       
                        
                    }
                    .padding(15)
                    .scrollIndicators(.hidden)
                    //.clipShape(RoundedRectangle(cornerRadius: 60, style: .continuous)
                    //        .path(in: CGRect(x: 10, y: 0, width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height)
                  //  ))
                    .ignoresSafeArea(edges: .bottom)
                    
                    
                        
                    
                }
                
                
            }
        }
        .toolbar {
        // Close Button
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Close") {
                    dismiss()
                }
            }

        // Edit Button
             ToolbarItem(placement: .navigationBarTrailing) {
                Button("Edit") {
                    // Show the edit view
                }
            }
        }
    }
}

#Preview {
    ProductDetailView()
}
