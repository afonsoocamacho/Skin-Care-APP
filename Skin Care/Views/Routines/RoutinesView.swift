//
//  RoutinesView.swift
//  Skin Care
//
//  Created by Afonso Camacho on 15/01/2025.
//

import SwiftUI
import SwiftData

struct RoutinesView: View {
    
    @Environment(\.modelContext) var context
    
    @State private var searchQuery = ""
    
    @Query(sort: \Routine.createdAt) var routines: [Routine] = []
    
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
                        .font(.title)
                        .accentColor(.pink)
                }
            }
            .padding(.leading, 15)
            .padding(.trailing, 10)
            
            VStack{
                HStack{
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search Routines by Name...", text: $searchQuery)
                            .foregroundColor(.primary)
                            .textInputAutocapitalization(.none)
                            .tint(.pink)
                            .disableAutocorrection(true)
                            .keyboardType(.asciiCapable)
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
                    
                    Button(action: {
                        print("Search")
                       }) {
                           Image(systemName: "line.3.horizontal.decrease.circle")
                               .font(.title3)
                               .tint(.pink)
                               .frame(alignment: .center)
                               .padding(.leading, -10)
                               .padding(.trailing, 15)
                               .padding(.bottom, 10)
                               //.onTapGesture(perform: .bounce.up.byLayer)
                           
                           
                           
                       }
                    
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
                
                ForEach(routines) { routine in
                        RoutineCardView(routine: routine)
                        .padding(.horizontal, 15)
                        .padding(.bottom, 3)
                }
                
             //   Text("^[\(routines.count) resoults found](inflect: true)")
             //       .font(.callout)
                    
            }
        }
        .background(AnimatedMeshGradient().edgesIgnoringSafeArea(.all).blur(radius: 7).offset(x: 10, y: 10).opacity(1))
    }
}

#Preview {
    // ✅ Create a SwiftData container for preview purposes
    do {
        let container = try ModelContainer(for: Routine.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))

        // ✅ Create sample Product data
        let sampleProducts = [
            Product(name: "Face Cleanser", type: "Cleanser", brand: "SkinCo", instructions: "Apply morning and night.", ingredients: "Water, Aloe Vera", price: 15.99, quantity: "150ml", status: .opened, openDate: Date(), lifeTime: 12, expirationDate: nil, imageData: nil, isFavorite: false, rating: 4, createdAt: Date(), lastUpdatedAt: Date()),
            Product(name: "Moisturizer", type: "Cream", brand: "GlowCare", instructions: "Apply after cleansing.", ingredients: "Shea Butter, Glycerin", price: 19.99, quantity: "100ml", status: .opened, openDate: Date(), lifeTime: 12, expirationDate: nil, imageData: nil, isFavorite: true, rating: 5, createdAt: Date(), lastUpdatedAt: Date())
        ]

        // ✅ Create sample Routines
        let sampleRoutines = [
            Routine(id: UUID(), name: "Morning Routine", type: .morning, timesDone: 2, products: sampleProducts, isFavorite: true, rating: 5, createdAt: Date(), lastUpdatedAt: Date()),
            Routine(id: UUID(), name: "Night Routine", type: .night, timesDone: 0, products: sampleProducts, isFavorite: false, rating: 4, createdAt: Date(), lastUpdatedAt: Date()),
            Routine(id: UUID(), name: "Special Care", type: .special, timesDone: 3, products: sampleProducts, isFavorite: false, rating: 3, createdAt: Date(), lastUpdatedAt: Date())
        ]

        // ✅ Insert sample data into the preview container
        for routine in sampleRoutines {
            container.mainContext.insert(routine)
        }

        // ✅ Attach the SwiftData environment
        return RoutinesView()
            .modelContainer(container)
    } catch {
        fatalError("Failed to create preview ModelContainer: \(error)")
    }
}
