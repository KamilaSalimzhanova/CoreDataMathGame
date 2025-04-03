//
//  LivesView.swift
//  CoreDataMathGame
//
//  Created by kamila on 03.04.2025.
//

import SwiftUI

struct LivesView: View {
    @State private var animateWave = false

    let imageName: Creatures
    let numberOfLives: Int
    let maxLives: Int
    var body: some View {
        HStack {
            ForEach(0..<maxLives, id:\.self) { i in
                Image(imageName.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35.0, height: 35.0, alignment: .center)
                    .opacity(i >= numberOfLives ? 0 : 1)
                    .offset(y: animateWave ? -3 : 3)
                    .animation(
                        Animation.easeInOut(duration: 0.9)
                            .repeatForever(),
                        value: animateWave
                    )
            }
        }.onAppear{
            animateWave.toggle()
        }
    }
}

struct LivesView_Previews: PreviewProvider {
    static var previews: some View {
        LivesView(imageName: .creature5, numberOfLives: 2, maxLives: 3)
    }
}
