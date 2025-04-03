//
//  GameOverView.swift
//  CoreDataMathGame
//
//  Created by kamila on 03.04.2025.
//

import SwiftUI

struct GameOverView: View {
    var body: some View {
        HStack {
            Label(title: {
                HStack(spacing: 15) {
                    Text("Game over")
                        .multilineTextAlignment(.center)
                    Image(systemName: "arrowshape.turn.up.backward.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 35, height: 35)
                        .foregroundColor(.red)
                }
            }, icon: {
                Image(Creatures.creature4.rawValue)
                    .resizable()
                    .frame(width: 55, height: 55)
                    .scaledToFit()
                    .padding()
            })
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .padding()
            .background(RoundedRectangle(cornerRadius: 20).fill(.thinMaterial))
        }
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.opacity(0.6).ignoresSafeArea()
            GameOverView()
        }
    }
}
