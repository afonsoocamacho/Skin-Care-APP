//
//  ProductsModel.swift
//  Skin Care
//
//  Created by Afonso Camacho on 15/01/2025.
//

import UIKit
import Foundation
import SwiftData


@Model
final class Product{
    
    @Attribute(.unique)
    var id: UUID = UUID()
    
    var name: String
    var type: String
    var brand: String
    var instructions: String?
    var ingredients: String?
    var price: Double?
    var quantity: String?
    
    var status: Status
    
    var openDate: Date?
    var lifeTime: Int?
    var expirationDate: Date? // Date of expiration of the product is calculated by the open date + lifetime
    
    @Attribute(.externalStorage)
    var imageData: Data?

    
    var isFavorite: Bool
    var rating: Int?
    
    var createdAt: Date
    var lastUpdatedAt: Date
    
    init(
        name: String,
        type: String,
        brand: String,
        instructions: String? = nil,
        ingredients: String? = nil,
        price: Double? = nil,
        quantity: String? = nil,
        
        status: Status = .opened,
        
        openDate: Date? = nil,
        lifeTime: Int? = nil,
        expirationDate: Date? = nil,
        
        imageData: Data? = nil,
        
        isFavorite: Bool,
        rating: Int? = nil,
        
        createdAt: Date = Date.now,
        lastUpdatedAt: Date = Date.now
    ) {
        self.name = name
        self.type = type
        self.brand = brand
        self.instructions = instructions
        self.ingredients = ingredients
        self.price = price
        self.quantity = quantity
        self.status = status
        self.openDate = openDate
        self.lifeTime = lifeTime
        self.expirationDate = expirationDate
        self.imageData = imageData
        self.isFavorite = isFavorite
        self.rating = rating
        self.createdAt = createdAt
        self.lastUpdatedAt = lastUpdatedAt
    }
    
}

enum Status: Int, Codable, Identifiable, CaseIterable {
    case opened, closed, expired, empty
    var id: Self {
        self
    }
    var descr: String {
        switch self {
        case .opened:
            return "Opened"
        case .closed:
            return "Closed"
        case .expired:
            return "Expired"
        case .empty:
            return "Empty"
        }
    }
}
