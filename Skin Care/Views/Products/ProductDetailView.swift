//
//  ProductDetailView.swift
//  Skin Care
//
//  Created by Afonso Camacho on 22/01/2025.
//

import PhotosUI
import SwiftUI

struct ProductDetailView: View {
    
    let product: Product
    @Environment(\.dismiss) private var dismiss
    
    @State private var isInstructionsExpanded = false
    @State private var isIngredientsExpanded = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(colors: [.pink, .white], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack{
                    
                    Spacer(minLength: 30)
                    
                    Text(product.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .minimumScaleFactor(0.5)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 3)
                    
                    HStack{
                        HStack{
                            Text(product.brand)
                                .multilineTextAlignment(.trailing)
                                .lineLimit(1)
                        }
                        
                        HStack {
                            Text("·")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        
                        HStack {
                            Text(product.type)
                                .multilineTextAlignment(.trailing)
                                .lineLimit(1)
                        }
                        
                    }
                    .foregroundColor(Color.white)
                    .padding(0)
                    
                    if product.status.descr == "Expired" {
                        
                        HStack{
                            
                            if product.expirationDate == nil || (product.expirationDate?.formatted(date: .numeric, time: .omitted) ?? "").isEmpty {
                                
                                Text("Expired @ unknown")
                                    
                                
                            } else {
                                
                                Text("Expired @ \(product.expirationDate!.formatted(date: .numeric, time: .omitted))")
                                
                            }

                            
                        }
                        .foregroundColor(Color.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 15)
                        .background(
                            RoundedRectangle(cornerRadius: 30)
                            //.fill(.green.opacity(0.2))
                                .fill(.ultraThinMaterial) )
                        
                    } else {
                        
                        Text(product.status.descr)
                            .foregroundColor(Color.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 15)
                            .background(
                                RoundedRectangle(cornerRadius: 30)
                                //.fill(.green.opacity(0.2))
                                    .fill(.ultraThinMaterial) )
                        
                    }
                    
                    Spacer(minLength: 10)
                    ScrollView{
                        VStack{
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.white)
                                    .frame(width: UIScreen.main.bounds.width - 80, height: 350)
                                
                                if product.imageData != nil,
                                      let uiImage = UIImage(data: product.imageData!){
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxWidth: .infinity, maxHeight: 300)
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                        
                                } else {
                                    Image(systemName: "photo")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxWidth: .infinity, maxHeight: 150)
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                        
                                }
                                

                                VStack{
                                    
                                HStack{
                                    Spacer()
                                    Button(action: {
                                        product.isFavorite.toggle() // Assuming product is mutable
                                            print("Favorite status: \(product.isFavorite)")
                                    }) {
                                        Image(systemName: product.isFavorite ? "heart.fill" : "heart")
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
                        
                        
                            VStack(alignment: .leading) {
                                
                                if let instructions = product.instructions, instructions.count > 120 { // Adjust character count if needed
                                    HStack{
                                        
                                        Text("Instructions")
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                            .padding(.bottom, 5)
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            isInstructionsExpanded.toggle()
                                        }) {
                                            Text(isInstructionsExpanded ? "See Less" : "See More")
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                        }
                                        .padding(.bottom, 5)
                                        
                                        
                                    }
                                    
                                } else {
                                    
                                    Text("Instructions")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .padding(.bottom, 5)
                                    
                                }
                            

                                Text(product.instructions ?? "No instructions available.")
                                    .lineLimit(isInstructionsExpanded ? nil : 3)
                                    //.animation(.easeInOut, value: isInstructionsExpanded)
                                
                               
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 5)

                            
                            Divider()
                            
                            VStack(alignment: .leading) {
                                
                                if let ingredients = product.ingredients, ingredients.count > 120 { // Adjust character count if needed
                                    HStack{
                                        
                                        Text("Ingredients")
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                            .padding(.bottom, 5)
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            isIngredientsExpanded.toggle()
                                        }) {
                                            Text(isIngredientsExpanded ? "See Less" : "See More")
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                        }
                                        .padding(.bottom, 5)
                                        
                                        
                                    }
                                    
                                } else {
                                    
                                    Text("Ingredients")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .padding(.bottom, 5)
                                    
                                }
                            

                                Text(product.ingredients ?? "No ingredients available.")
                                    .lineLimit(isIngredientsExpanded ? nil : 3)
                                    //.animation(.easeInOut, value: isInstructionsExpanded)
                                
                               
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 5)
                        
                            Divider()
                            HStack{
                                
                                Spacer()
                                
                                VStack (){
                                    
                                    Text("Open Date")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .padding(.bottom, 5)
                                        .multilineTextAlignment(.center)
                                    
                                    Text(product.openDate?.formatted(date: .numeric, time: .omitted) ?? "No open date available.")
                                }
                                .padding(.vertical, 10)
                                .padding(.horizontal, 5)
                                
                                Spacer()
                                
                                Divider()
                                
                                if product.expirationDate != nil {
                                    VStack (){
                                        
                                        Text("Expiration Date")
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                            .padding(.bottom, 5)
                                            .multilineTextAlignment(.center)
                                        
                                        Text(product.expirationDate?.formatted(date: .numeric, time: .omitted) ?? "No open date available.")
                                    }
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 5)
                                    
                                    Spacer()
                                    
                                    Divider()
                                }
                                
                                Spacer()
                                
                                VStack (){
                                    
                                    Text("LifeTime")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .padding(.bottom, 5)
                                        .multilineTextAlignment(.center)
                                    
                                    Text("\(product.lifeTime.map(String.init) ?? "N/A") Months")
                                }
                                .padding(.vertical, 10)
                                .padding(.horizontal, 5)
                                
                                Spacer()
                            }
                            
                            
                            Divider()
                            
                            VStack (){
                                
                                Text("Your Rating")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .padding(.bottom, 5)
                                    .multilineTextAlignment(.center)
                                
                                HStack {
                                    ForEach(0..<5, id: \.self) { index in
                                        Image(systemName: index < (product.rating ?? 0) ? "star.fill" : "star")
                                            .font(.title2)
                                            .foregroundColor(index < (product.rating ?? 0) ? .yellow : .gray)
                                    }
                                }

                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 5)
                            
                            Divider()
                            
                            HStack{
                                
                                Spacer()
                                
                                VStack (){
                                    
                                    Text("Quantity")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .padding(.bottom, 5)
                                        .multilineTextAlignment(.center)
                                    
                                    Text(product.quantity ?? "N/A")
                                }
                                .padding(.vertical, 10)
                                .padding(.horizontal, 5)
                                
                                Spacer()
                                
                                Divider()
                                
                                Spacer()
                                
                                VStack (){
                                    
                                    Text("Price")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .padding(.bottom, 5)
                                        .multilineTextAlignment(.center)
                                    
                                    Text(product.price?.formatted(.currency(code: "EUR")) ?? "N/A")
                                }
                                .padding(.vertical, 10)
                                .padding(.horizontal, 5)
                                
                                Spacer()
                                
                            }
                        }
                        .padding(25)
                        .background(
                            RoundedRectangle(cornerRadius: 30)
                                //.fill(.green.opacity(0.2))
                                .fill(.ultraThinMaterial) )
                        
                        
                        VStack {
                            Text("Last updated: \(product.lastUpdatedAt.formatted(date: .numeric, time: .omitted))")
                                .font(.subheadline)
                                .padding(.top, 2)

                            Text("Created at: \(product.createdAt.formatted(date: .numeric, time: .omitted))")
                                .font(.subheadline)
                                .padding(.top, 2)
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
        
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left") // Back button icon
                            .foregroundColor(.white)
                    }
                }

//                ToolbarItem(placement: .principal) { // Centered title
//                    Text("Product Details")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                }

                
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            print("Edit tapped")
                        }) {
                            Text("Edit")
                                .foregroundColor(.white) // Change color
                                .fontWeight(.semibold) // Change font weight
                        }
                    }
                
            }

        }
    }
}

#Preview {
    ProductDetailView(
        product: Product(
            name: "Moisturizer Test multilayber cream",
            type: "Skincare",
            brand: "SkinCare Co",
            instructions: "Apply evenly on the face. andn thes just to test the button when will it appear cuz it shouln't display much contnt there and then the buttun wand i wanna check theanimation",
            ingredients: "Water, Glycerin, etc.",
            price: 19.99,
            quantity: "100ml",
            status: .expired,
            openDate: Date(),
            lifeTime: 12,
            expirationDate: Date(),
            imageData: nil,
            isFavorite: false,
            rating: 4,
            createdAt: Date(),
            lastUpdatedAt: Date()
        )
    )
}

