//
//  ProductCard.swift
//  Skin Care
//
//  Created by Afonso Camacho on 15/01/2025.
//

import SwiftUI

struct ProductCardView: View {
    
    let product: Product
    
    
    
    var body: some View {
        ZStack() {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.clear)
                
            
            if let imageData = product.imageData,
               let uiImage = UIImage(data: imageData){
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .offset(y: -20)
            }
            
            
            VStack () {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        product.isFavorite.toggle() // Assuming product is mutable
                            print("Favorite status: \(product.isFavorite)")
                    }) {
                        Image(systemName: product.isFavorite ? "heart.fill" : "heart")
                            .accentColor(.pink)
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
                            Text(product.name)
                                .font(.headline)
                            HStack (alignment: .lastTextBaseline){
                                Text(product.type)
                                    .font(.subheadline)
                                Spacer()
                                Text(product.brand)
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
    ProductCardView(
        product: Product(
            name: "Moisturizer",
            type: "Skincare",
            brand: "SkinCare Co",
            instructions: "Apply evenly on face.",
            ingredients: "Water, Glycerin, etc.",
            price: 19.99,
            quantity: "100ml",
            status: .opened,
            openDate: Date(),
            lifeTime: 12,
            expirationDate: nil,
            imageData: nil,
            isFavorite: false,
            rating: 4,
            createdAt: Date(),
            lastUpdatedAt: Date()
        )
    )
}
