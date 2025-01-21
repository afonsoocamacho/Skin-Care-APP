//
//  AddProductView.swift
//  Skin Care
//
//  Created by Afonso Camacho on 21/01/2025.
//

import SwiftUI
import PhotosUI

struct AddProductView: View {
    
    @Environment(\.modelContext) var context
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var type: String = ""
    @State private var brand: String = ""
    @State private var instructions: String = ""
    @State private var ingredients: String = ""
    @State private var price: Double = 0.0
    @State private var quantity: String = ""
    
    @State private var selectedImage: PhotosPickerItem?
    @State private var selectedImageData: Data?
    @State private var imageData: Data?
    
    @State private var status: Status = .opened
    
    @State private var openDate: Date = Date()
    @State private var lifeTime: Int = 0
    
    @State private var isFavorite: Bool = false
    @State private var rating: Int = 0
    
    @State private var createdAt: Date = Date()
    @State private var lastUpdatedAt: Date = Date()
    
    
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    
                    if let selectedImageData,
                       let uiImage = UIImage(data: selectedImageData){
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: 300)
                    }
                    
                    PhotosPicker(
                        selection: $selectedImage,
                        matching: .images,
                        photoLibrary: .shared()){
                            Label("Add Image", systemImage: "photo")
                        }
                    
                    if selectedImageData != nil {
                        Button(role: .destructive){
                            withAnimation{
                                selectedImage = nil
                                selectedImageData = nil
                            }
                        } label:{
                            Label ("Remove Image", systemImage: "trash")
                                .foregroundColor(.red)
                        }
                    }
                    
                }
                
                Section(){
                    TextField("Product Name", text: $name)
                    TextField("Type", text: $type)
                    TextField("Brand", text: $brand)
                    
                }
                
                Section(){
                    TextField("Instructions", text: $instructions)
                    TextField("Ingredients", text: $ingredients)
                    TextField("Price", value: $price, format: .currency(code: "EUR"))
                    TextField("Quantity (ml, g)", text: $quantity)
                }
                
                Section("Status"){
                    Picker("Status", selection: $status) {
                        ForEach(Status.allCases) { status in
                            Text(status.descr).tag(status)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    DatePicker("Open Date", selection: $openDate, displayedComponents: .date)
                    
                    Stepper("Lifetime                 \(lifeTime) Months", value: $lifeTime, in: 0...100)
                    
                    HStack {
                        Text("Rating")
                        Spacer()
                        ForEach(1...5, id: \.self) { star in
                            Image(systemName: star <= rating ? "star.fill" : "star")
                                .foregroundColor(star <= rating ? .yellow : .gray)
                                .onTapGesture {
                                    rating = star
                                }
                                .font(.body) // Adjust the size of the stars
                            
                        }
                    }
                    HStack {
                        Text("Mark as Favorite")
                        Spacer() // Push the heart to the right
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(isFavorite ? .pink : .gray)
                            .onTapGesture {
                                isFavorite.toggle()
                            }
                            .font(.title3) // Adjust size of the heart icon
                    }
                    
                    
                }
            }
            .navigationTitle("Add Product")
            .navigationBarTitleDisplayMode(.inline)
            .task(id: selectedImage) {
                if let data = try? await selectedImage?.loadTransferable(type: Data.self) {
                    selectedImageData = data
                    imageData = data // Ensure imageData is updated
                } else {
                    selectedImageData = nil
                    imageData = nil // Clear imageData if no valid image is loaded
                }
            }
            .scrollDismissesKeyboard(.interactively)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss() // Close the view
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        saveProduct() // Save the product and dismiss
                    }
                }
            }

            
        }
    }
    private func saveProduct() {
        let product = Product(
            name: name,
            type: type,
            brand: brand,
            instructions: instructions,
            ingredients: ingredients,
            price: price,
            quantity: quantity,
            status: status,
            openDate: openDate,
            lifeTime: lifeTime,
            imageData: imageData,
            isFavorite: isFavorite,
            rating: rating,
            createdAt: createdAt,
            lastUpdatedAt: lastUpdatedAt
        )
        
        context.insert(product)
        
        do {
            try context.save() // Save the product to the SwiftData context
            dismiss()
        } catch {
            print("Failed to save product: \(error.localizedDescription)")
        }
    }

}

#Preview {
    AddProductView()
}
