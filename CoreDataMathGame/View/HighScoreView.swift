//
//  HighScoreView.swift
//  CoreDataMathGame
//
//  Created by kamila on 03.04.2025.
//

import SwiftUI

struct HighScoreView: View {
    @EnvironmentObject private var hVM: HighScoreViewModel
    var body: some View {
        ZStack {
            HighScoreBackgroundView()
            VStack {
                HighScoreTitle()
                List {
                    ForEach(Array(hVM.highScores.enumerated()), id:\.offset) { (idx, entity) in
                        RankScoreView(rank: idx+1, score: Int(entity.score), entity: entity)
                    }
                    .onDelete(perform: hVM.deleteScore)
                }
                .listStyle(.sidebar)
                Image(Creatures.creature4.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: .infinity, height: 100)
            }
        }
    }
}

struct HighScoreView_Previews: PreviewProvider {
    static var previews: some View {
        HighScoreView().environmentObject(HighScoreViewModel())
    }
}
