//
//  HighScoreTitle.swift
//  CoreDataMathGame
//
//  Created by kamila on 04.04.2025.
//

import SwiftUI

struct HighScoreTitle: View {
    var body: some View {
        HStack {
            VTextImage(imageName: Creatures.creature0.rawValue, text: "Rank", dimension: 35)
            VTextImage(imageName: Creatures.creature1.rawValue, text: "Score", dimension: 35)
            VTextImage(imageName: Creatures.creature2.rawValue, text: "Name", dimension: 35)
        }
        .padding(.horizontal)
    }
}


struct HighScoreTitle_Previews: PreviewProvider {
    static var previews: some View {
        HighScoreTitle()
    }
}
