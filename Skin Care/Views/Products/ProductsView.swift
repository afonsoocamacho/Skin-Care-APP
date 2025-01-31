//
//  ProductsView.swift
//  Skin Care
//
//  Created by Afonso Camacho on 15/01/2025.
//

import SwiftUI
import SwiftData

struct ProductsView: View {
    
    @Environment(\.modelContext) var context
    
    @State private var searchQuery = ""
    @State private var showAddProductView = false
    @State private var selectedProduct: Product? // Track the selected product
    
    @Query(sort: \Product.createdAt) var products: [Product] = []
    
    var filteredProducts: [Product] {
        
        if searchQuery.isEmpty{
            return products
        }
        
        let filteredProducts = products.compactMap { product in
            let nameContainsQuery = product.name.range(of: searchQuery, options: .caseInsensitive) != nil
            
            return nameContainsQuery ? product : nil
        }
        
        return filteredProducts
    }
    
    var body: some View {
        VStack {
            HStack (){
                Text("My Products")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                Button(action: {
                    print("add product")
                    showAddProductView = true
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                        .accentColor(.pink)
                }
            }
            .padding(.leading, 15)
            .padding(.trailing, 10)
            
            VStack{
                //Search bar
                HStack{
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search Products by Name...", text: $searchQuery)
                            .foregroundColor(.primary)
                            .textInputAutocapitalization(.none)
                            .tint(.pink)
                        if !searchQuery.isEmpty {
                            Button(action: {
                                searchQuery = "" // Clear the search query
                                hideKeyboard()
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .padding(10)
                    .background( RoundedRectangle(cornerRadius: 7)
                        .fill(Material.ultraThick)
                                 
                    )
                    .padding(.horizontal, 15)
                    .padding(.top, -10)
                    
                    //if !searchQuery.isEmpty {
                  //      Button(action: {
                   //         searchQuery = "" // Clear the search query
                  //          hideKeyboard()
                  //      }) {
                //            Text("Cancel")
                  //              .foregroundColor(.pink)
                    //            .frame(alignment: .center)
                      //          .padding(.trailing, 15)
                        //        .padding(.leading, -10)
                          //      .padding(.bottom, 10)
                    //    }
                 //   }
                    
                }
                Text("Filters")
                //fiter options
                //archived??
            }
            .padding(.top, 5)
            
            ScrollView{
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 2), spacing: 10) {
                    
                    ForEach(filteredProducts) { product in
                        ProductCardView(product: product)
                            .onTapGesture {
                               selectedProduct = product // Set the selected product
                                                        }
                            .contextMenu {
                                Button(role: .destructive) {
                                    deleteProduct(product)
                                } label: {
                                    Label("Delete Product", systemImage: "trash")
                                }
                            }
                            
                    }
                    
                    
                    
                    
                }
                .padding(10)
            }
        }
        .background(AnimatedMeshGradient().edgesIgnoringSafeArea(.all).blur(radius: 7).offset(x: 10, y: 10).opacity(1).onTapGesture{ hideKeyboard()})
        .sheet(item: $selectedProduct) { product in
                    ProductDetailView(product: product)
                }
        .sheet(isPresented: $showAddProductView) {  AddProductView()  }
        .overlay{
            if !searchQuery.isEmpty && filteredProducts.isEmpty && !products.isEmpty{
                ContentUnavailableView.search
            }
            
            if !searchQuery.isEmpty && filteredProducts.isEmpty && products.isEmpty{
                ContentUnavailableView(label: {
                    Label("No products", systemImage: "exclamationmark.triangle")
                }, description: {
                    Text("You don't have any products yet. Add a product to get started.")
                }, actions: {
                    Button("Add Product") { showAddProductView = true }
                })
            }
            
            if searchQuery.isEmpty && products.isEmpty {
                ContentUnavailableView(label: {
                    Label("No products", systemImage: "exclamationmark.triangle")
                }, description: {
                    Text("You don't have any products yet. Add a product to get started.")
                }, actions: {
                    Button("Add Product") { showAddProductView = true }
                })
            }
        }
        
    }
    private func deleteProduct(_ product: Product) {
            context.delete(product) // Remove the product from SwiftData context
            try? context.save()     // Save changes to persist the deletion
        }
}

#Preview {
    ProductsView()
}
