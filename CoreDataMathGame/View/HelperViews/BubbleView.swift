//
//  BubbleView.swift
//  CoreDataMathGame
//
//  Created by kamila on 03.04.2025.
//

import SwiftUI

struct BubbleView: View {
    @State private var rotate = 0.0
    let textColor: Color
    let backgroundColor: Color
    let text: String
    let name: String
    let bubbleSize: CGFloat
    
    var body: some View {
        Text(text)
            .foregroundColor(textColor)
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding()
            .background(
                Image(name)
                    .resizable()
                    .scaledToFill()
                    .frame(width: bubbleSize, height: bubbleSize) 
                    .opacity(0.7)
                    .rotationEffect(Angle(degrees: rotate))
                    .background(backgroundColor)
                    .clipShape(Circle())
                    .animation(.linear(duration: 15).repeatForever(autoreverses: false), value: rotate)
            )
            .padding()
            .onAppear {
                rotate = 360
            }
    }
}

struct BubbleView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            BubbleView(textColor: .white, backgroundColor: .pink.opacity(0.5), text: "24", name: "bubble1", bubbleSize: 200)
        }
    }
}
