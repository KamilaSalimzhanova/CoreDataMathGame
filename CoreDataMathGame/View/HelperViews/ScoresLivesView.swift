//
//  ScoresLivesView.swift
//  CoreDataMathGame
//
//  Created by kamila on 03.04.2025.
//

import SwiftUI

struct ScoresLivesView: View {
    let scores: Int
    let lives: Int
    let maxLives: Int
    let levels: Int
    
    var body: some View {
        HStack(alignment: .center) {
            TitleValueView(title: "Score", value: scores)
            Spacer()
            TitleValueView(title: "Levels", value: levels)
            Spacer()
            LivesView(imageName: .creature5, numberOfLives: lives, maxLives: maxLives)
        }
        .font(.headline)
        .padding()
    }
}

struct ScoresLivesView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            MainBackgroundView(opacity: 0.55)
            ScoresLivesView(scores: 22, lives: 2, maxLives: 3, levels: 7)
        }
    }
}
