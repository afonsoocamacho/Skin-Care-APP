//
//  RoutinesModel.swift
//  Skin Care
//
//  Created by Afonso Camacho on 03/02/2025.
//

import Foundation
import UIKit
import SwiftData

@Model
final class Routine{
    
    @Attribute(.unique)
    var id: UUID = UUID()
    
    var name: String
    var type: RoutineType
    
    var timesDone: Int = 0
    
    var products: [Product]
    
    var isFavorite: Bool
    var rating: Int?
    
    var createdAt: Date
    var lastUpdatedAt: Date
    
    init(
        id: UUID,
        name: String,
        type: RoutineType,
        timesDone: Int,
        products: [Product],
        isFavorite: Bool,
        rating: Int? = nil,
        createdAt: Date,
        lastUpdatedAt: Date
    ) {
        self.id = id
        self.name = name
        self.type = type
        self.timesDone = timesDone
        self.products = products
        self.isFavorite = isFavorite
        self.rating = rating
        self.createdAt = createdAt
        self.lastUpdatedAt = lastUpdatedAt
    }
    
}

enum RoutineType: Int, Codable, Identifiable, CaseIterable {
    case morning, night, special
    var id: Self {
        self
    }
    var descr: String {
        switch self {
        case .morning:
            return "Morning"
        case .night:
            return "Night"
        case .special:
            return "Special"
        }
    }
    var symbol: String {
           switch self {
           case .morning:
               return "sun.max.fill"
           case .night:
               return "moon.fill"
           case .special:
               return "staroflife.fill"
           }
    }
}
