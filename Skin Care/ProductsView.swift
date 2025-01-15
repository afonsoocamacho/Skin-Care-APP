//
//  ProductsView.swift
//  Skin Care
//
//  Created by Afonso Camacho on 15/01/2025.
//

import SwiftUI

struct ProductsView: View {
    var body: some View {
        VStack {
            HStack (){
                Text("My Products")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                Button(action: {
                    print("filter item")
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                        .accentColor(.teal)
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
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 2), spacing: 10) {
                    
                    ProductCardView()
                    ProductCardView()
                    ProductCardView()
                    ProductCardView()
                    ProductCardView()
                    
                    
                }
                .padding(10)
            }
        }
    }
}

#Preview {
    ProductsView()
}
