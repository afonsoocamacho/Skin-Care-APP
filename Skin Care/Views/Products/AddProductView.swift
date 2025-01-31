//
//  AddProductView.swift
//  Skin Care
//
//  Created by Afonso Camacho on 21/01/2025.
//

import SwiftUI
import Vision
import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI


struct AddProductView: View {
    
    @Environment(\.modelContext) var context
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var type: String = ""
    @FocusState private var isTypeFieldFocused: Bool
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
                        .disableAutocorrection(true)
                        .keyboardType(.asciiCapable)
                    TextField("Type", text: $type)
                        .focused($isTypeFieldFocused)
                        .disableAutocorrection(true)
                        .keyboardType(.asciiCapable)
                    TextField("Brand", text: $brand)
                        .disableAutocorrection(true)
                        .keyboardType(.asciiCapable)
                    
                }
                
                Section(){
                    TextField("Instructions", text: $instructions)
                    TextField("Ingredients", text: $ingredients)
                    TextField("Price", value: $price, format: .currency(code: "EUR"))
                        .disableAutocorrection(true)
                        .keyboardType(.numbersAndPunctuation)
                    TextField("Quantity (ml, g)", text: $quantity)
                        .disableAutocorrection(true)
                        .keyboardType(.numbersAndPunctuation)
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
                print("📂 New image selected. Processing...")

                if let data = try? await selectedImage?.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    
                    print("✅ Image loaded successfully!")

                    guard let inputImage = CIImage(image: uiImage) else {
                        print("❌ Failed to create CIImage from uploaded image.")
                        return
                    }

                    print("🔄 Running Vision processing to remove background...")

                    Task {
                        if let maskImage = await createMask(from: inputImage) {
                            let outputImage = applyMask(mask: maskImage, to: inputImage)
                            let finalImage = convertToUIImage(ciImage: outputImage)

                            print("🎉 Background removed successfully!")
                            
                            selectedImageData = finalImage.pngData()
                            imageData = selectedImageData
                        } else {
                            print("⚠️ Failed to remove background. Using original image.")
                            selectedImageData = data
                            imageData = data
                        }
                    }
                } else {
                    print("❌ Failed to load image data.")
                    selectedImageData = nil
                    imageData = nil
                }
            }


            .scrollDismissesKeyboard(.interactively)
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    HStack {
                        if isTypeFieldFocused { // ✅ Show only when "Type" is focused
                            Button(action: {
                                hideKeyboard()
                            }) {
                                Image(systemName: "moon.circle.fill") // SF Symbol for the toolbar
                                    .font(.title2)
                                    .tint(.pink) // Tint the icon
                            }
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            hideKeyboard()
                        }) {
                            Image(systemName: "keyboard.chevron.compact.down") // SF Symbol for the toolbar
                                .font(.title2)
                                .tint(.pink) // Tint the icon
                        }
                    }
                    }
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
    
    
// MARK - Functions
    
    private func createMask(from inputImage: CIImage) async -> CIImage? {
        
        print("🔍 Starting mask generation...")
        
        let request = VNGenerateForegroundInstanceMaskRequest()
        let handler = VNImageRequestHandler(ciImage: inputImage)

        do {
            try handler.perform([request])
            print("✅ Vision request performed successfully!")

            if let result = request.results?.first {
                print("📸 Mask generated successfully. Processing...")
                let mask = try result.generateScaledMaskForImage(forInstances: result.allInstances, from: handler)
                print("🖼 Mask applied successfully!")
                return CIImage(cvPixelBuffer: mask)
            }
        } catch {
            print("Error generating mask: \(error)")
            
        }

        return nil
    }

    private func applyMask(mask: CIImage, to image: CIImage) -> CIImage {
        print("🎭 Applying mask to remove background...")
        
        let filter = CIFilter.blendWithMask()
        filter.inputImage = image
        filter.maskImage = mask
        filter.backgroundImage = CIImage.empty()
        
        if let outputImage = filter.outputImage {
                print("✅ Successfully applied mask!")
                return outputImage
            } else {
                print("❌ Error: Mask application failed!")
                return image
            }
    }

    private func convertToUIImage(ciImage: CIImage) -> UIImage {
        print("🔄 Converting CIImage to UIImage...")
        
        let context = CIContext()
        guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else {
            fatalError("❌ Failed to render CGImage from CIImage")
        }
        print("✅ Conversion successful!")
        return UIImage(cgImage: cgImage)
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
