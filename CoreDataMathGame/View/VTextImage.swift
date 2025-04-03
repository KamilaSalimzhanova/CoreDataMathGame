//
//  VTextImaga.swift
//  CoreDataMathGame
//
//  Created by kamila on 04.04.2025.
//

import SwiftUI

struct VTextImage: View {
    @State private var xOffset: CGFloat = 0
    
    let imageName: String
    let text: LocalizedStringKey
    let dimension: Double
    
    var body: some View {
        VStack(spacing: 0) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: dimension, height: dimension)
                .offset(x: xOffset)
                .onAppear {
                    withAnimation(Animation.easeOut(duration: 0.75).repeatForever(autoreverses: true)) {
                        xOffset = 2
                    }
                }
                    Text(text)
                        .fixedSize(horizontal: true, vertical: false)
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
        }
    }
    
    
    struct VTextImage_Previews: PreviewProvider {
        static var previews: some View {
            VTextImage(imageName: Creatures.creature0.rawValue, text: "Rank", dimension: 50)
        }
    }
