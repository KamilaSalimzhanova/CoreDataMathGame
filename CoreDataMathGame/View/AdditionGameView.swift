//
//  AdditionGameView.swift
//  CoreDataMathGame
//
//  Created by kamila on 03.04.2025.
//

import SwiftUI

struct AdditionGameView: View {
    @StateObject private var gameViewModel = AdditionGameViewModel()
    var body: some View {
        ZStack {
            MainBackgroundView()
            VStack {
                ScoresLivesView(scores: gameViewModel.score, lives: gameViewModel.lives, maxLives: 3, levels: gameViewModel.levels)
                Spacer()
            }
        }
    }
}

struct AdditionGameView_Previews: PreviewProvider {
    static var previews: some View {
        AdditionGameView()
    }
}
