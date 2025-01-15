//
//  ProductCard.swift
//  Skin Care
//
//  Created by Afonso Camacho on 15/01/2025.
//

import SwiftUI

struct ProductCardView: View {
    var body: some View {
        ZStack() {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.gray)
            VStack () {
                HStack {
                    Spacer()
                    Button(action: {
                        print("Add Product")
                    }) {
                        Image(systemName: "heart")
                            .accentColor(.teal)
                            .padding(.top, 10)
                            .padding(.trailing, 10)
                    }
                }
                Spacer()
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.ultraThinMaterial)
                        .frame(height: 60)
                    HStack{
                        VStack(alignment: .leading) {
                            Text("Product Name")
                                .font(.headline)
                            HStack (alignment: .lastTextBaseline){
                                Text("Type")
                                    .font(.subheadline)
                                Spacer()
                                Text("Brand")
                                    .font(.footnote)
                            }
                        }
                        .padding(.leading, 10)
                        .padding(.trailing, 5)
                        Spacer()
                    }
                }
            }
        }
        .frame(height: 200)
    }
}

#Preview {
    ProductCardView()
}
