//
//  Extentions.swift
//  Skin Care
//
//  Created by Afonso Camacho on 21/01/2025.
//

import Foundation
import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
