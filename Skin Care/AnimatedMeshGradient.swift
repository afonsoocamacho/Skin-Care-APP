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
        ZStack{
            MeshGradient(
                    width: 3,
                    height: 3
                    ,
                    points: [
                        [0.0, 0.0], [0.5, 0.0], [1.0, 0.0],
                        [0.0, 0.5], [0.5, 0.5], [1.0, 0.5],
                        [0.0, 1.0], [0.35, 1.0],[1.0, 1.0]
                        
                    ],
                    colors:[
                        .white, .white, .white,
                        .white, .white, .white,
                        .white, .pink, .pink,
                        
                    ])
        MeshGradient(
            width: 3,
            height: 3
            ,
            points: [
                [0.0, 0.0], [0.5, 0.0], [1.0, 0.0],
                [0.0, 0.5], [0.5, 0.5], [1.0, 0.5],
                [0.0, 1.0], [0.35, 1.0],appear ? [1.0, 1.0] : [0.95, 0.95]
               
            ],
            colors:[
                .white, .white, .white,
                .white, .white, appear ? .white : .clear,
                .white, appear ? .white : .clear, appear ? .pink : .clear,
            
            ])
        .onAppear{
            withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)){
                appear.toggle()
            }
        }
            

                
         
        }
    }
}

#Preview {
    AnimatedMeshGradient()
        .ignoresSafeArea()
}
