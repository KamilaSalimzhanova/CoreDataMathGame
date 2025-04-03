//
//  AdditionGameView.swift
//  CoreDataMathGame
//
//  Created by kamila on 03.04.2025.
//

import SwiftUI

struct AdditionGameView: View {
    @EnvironmentObject private var highScoreVm: HighScoreViewModel
    @StateObject private var gameViewModel = AdditionGameViewModel()
    @State private var highScorePresented = false
    @State private var name = ""
    
    var showHighScore: Bool {
        gameViewModel.gameModel.gameOver && highScoreVm.isNewHighScore(Int64(gameViewModel.score))
    }
    private var showGameOverView: Bool { gameViewModel.gameModel.gameOver }
    var body: some View {
        ZStack {
            MainBackgroundView()
            VStack {
                ScoresLivesView(scores: gameViewModel.score, lives: gameViewModel.lives, maxLives: 3, levels: gameViewModel.levels)
                Spacer()
                BubbleView(textColor: .white, backgroundColor: .purple.opacity(0.5),
                           text: "\(gameViewModel.number1) + \(gameViewModel.number2)",
                           name: "bubble1", bubbleSize: CGFloat(200))

                Spacer()
                OptionsView(vm: gameViewModel)
            }
            .padding()
            .blur(radius: showGameOverView ? 5 : 0)
            .disabled(showGameOverView)
            
            GameOverView()
                .padding()
                .blur(radius: showGameOverView ? 0 : 300)
                .opacity(showGameOverView ? 1 : 0)
                .disabled(!showGameOverView)
                .onTapGesture {
                    gameViewModel.reset()
                }
        }
        .fullScreenCover(isPresented: $highScorePresented, onDismiss: { gameViewModel.reset() }) {
            EnterNewHighScoreView(name: $name, isPresented: $highScorePresented, score: gameViewModel.score)
        }
        .onChange(of: showHighScore) { newValue in
            highScorePresented = newValue
        }
    }
}

struct AdditionGameView_Previews: PreviewProvider {
    static var previews: some View {
        AdditionGameView().environmentObject(HighScoreViewModel())
    }
}
