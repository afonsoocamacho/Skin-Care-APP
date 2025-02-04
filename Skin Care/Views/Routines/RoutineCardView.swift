//
//  RoutineCardView.swift
//  Skin Care
//
//  Created by Afonso Camacho on 03/02/2025.
//

import SwiftUI

struct RoutineCardView:View {
    
    let routine: Routine
    
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.gray.opacity(0.2))
                .fill(.thickMaterial)
            
            HStack{
                VStack (alignment: .leading){
                    HStack{
                        Text(routine.name)
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Image(systemName: routine.type.symbol)
                    }
                   
                    Text("^[\(routine.products.count) Steps](inflect: true)")
                        .font(.subheadline)
                    HStack{
                        
                        ForEach(Array(routine.products.prefix(5).enumerated()), id: \.element.id) { index, product in
                            if let imageData = product.imageData, let uiImage = UIImage(data: imageData) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFit()
                                    .padding(2)
                                    .frame(width: 20, height: 20)
                                    .clipShape(Circle())
                                    .offset(x: CGFloat(index) * -20) // ✅ Dynamic offset
                            } else {
                                Image(systemName: "photo") // Default placeholder
                                    .resizable()
                                    .scaledToFit()
                                    .padding(2)
                                    .frame(width: 20, height: 20)
                                    .clipShape(Circle())
                                    .offset(x: CGFloat(index) * -20) // ✅ Offset applied
                            }
                        }

                        // ✅ Display "+X More" if more than 5 products exist
                        if routine.products.count > 5 {
                            Text("^[+\(routine.products.count - 5) steps](inflect: true)")
                                .font(.footnote)
                                .foregroundColor(.gray)
                                .offset(x: CGFloat(4) * -20) // ✅ Position it below the last icon
                        }


                        
                        
                    }
                    
                    
                    
                }
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.title)
            }
            .padding(15)
        }

        
    }
}

#Preview {
    // ✅ Create sample Product data
    let sampleProducts = [
        Product(name: "Face Cleanser", type: "Cleanser", brand: "SkinCo", instructions: "Apply morning and night.", ingredients: "Water, Aloe Vera", price: 15.99, quantity: "150ml", status: .opened, openDate: Date(), lifeTime: 12, expirationDate: nil, imageData: nil, isFavorite: false, rating: 4, createdAt: Date(), lastUpdatedAt: Date()),
        Product(name: "Face Cleanser", type: "Cleanser", brand: "SkinCo", instructions: "Apply morning and night.", ingredients: "Water, Aloe Vera", price: 15.99, quantity: "150ml", status: .opened, openDate: Date(), lifeTime: 12, expirationDate: nil, imageData: nil, isFavorite: false, rating: 4, createdAt: Date(), lastUpdatedAt: Date()),
        Product(name: "Face Cleanser", type: "Cleanser", brand: "SkinCo", instructions: "Apply morning and night.", ingredients: "Water, Aloe Vera", price: 15.99, quantity: "150ml", status: .opened, openDate: Date(), lifeTime: 12, expirationDate: nil, imageData: nil, isFavorite: false, rating: 4, createdAt: Date(), lastUpdatedAt: Date()),
        Product(name: "Face Cleanser", type: "Cleanser", brand: "SkinCo", instructions: "Apply morning and night.", ingredients: "Water, Aloe Vera", price: 15.99, quantity: "150ml", status: .opened, openDate: Date(), lifeTime: 12, expirationDate: nil, imageData: nil, isFavorite: false, rating: 4, createdAt: Date(), lastUpdatedAt: Date()),
        Product(name: "Face Cleanser", type: "Cleanser", brand: "SkinCo", instructions: "Apply morning and night.", ingredients: "Water, Aloe Vera", price: 15.99, quantity: "150ml", status: .opened, openDate: Date(), lifeTime: 12, expirationDate: nil, imageData: nil, isFavorite: false, rating: 4, createdAt: Date(), lastUpdatedAt: Date()),
        Product(name: "Moisturizer", type: "Cream", brand: "GlowCare", instructions: "Apply after cleansing.", ingredients: "Shea Butter, Glycerin", price: 19.99, quantity: "100ml", status: .opened, openDate: Date(), lifeTime: 12, expirationDate: nil, imageData: nil, isFavorite: true, rating: 5, createdAt: Date(), lastUpdatedAt: Date())
    ]

    // ✅ Create a sample Routine using the products
    let sampleRoutine = Routine(
        id: UUID(),
        name: "Morning Routine",
        type: .morning,
        timesDone: 2,
        products: sampleProducts,
        isFavorite: true,
        rating: 5,
        createdAt: Date(),
        lastUpdatedAt: Date()
    )

    // ✅ Pass sampleRoutine to the preview
    return RoutineCardView(routine: sampleRoutine)
}

