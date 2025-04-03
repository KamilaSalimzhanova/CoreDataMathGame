//
//  HighScoreView.swift
//  CoreDataMathGame
//
//  Created by kamila on 03.04.2025.
//

import SwiftUI

struct HighScoreView: View {
    var body: some View {
        ZStack {
            HighScoreBackgroundView()
            Text("High score game view")
        }
    }
}

struct HighScoreView_Previews: PreviewProvider {
    static var previews: some View {
        HighScoreView()
    }
}
