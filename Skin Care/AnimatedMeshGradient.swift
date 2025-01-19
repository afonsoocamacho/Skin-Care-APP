//
//  AnimatedMeshGradient.swift
//  Skin Care
//
//  Created by Afonso Camacho on 19/01/2025.
//

import SwiftUI

struct AnimatedMeshGradient: View {
    
    @State var appear = false
    
    var body: some View {
        MeshGradient(
            width: 3,
            height: 3,
            points: [
                [0.0, 0.0], [0.5, 0.0], [1.0, 0.0],
                [0.0, 0.5], [0.5, 0.5], [1.0, 0.5],
                [0.0, 1.0], [0.5, 1.0], [1.0, 1.0]
            ],
            colors:[
                .white, .white, .white,
                .white, .white, .white,
                .white, .white, .mint
            ])
        .onAppear{
            withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)){
                 appear.toggle()
            }
        }
    }
}

#Preview {
    AnimatedMeshGradient()
        .ignoresSafeArea()
}
