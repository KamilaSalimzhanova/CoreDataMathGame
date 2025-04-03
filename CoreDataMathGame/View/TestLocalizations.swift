//
//  TestLocalizations.swift
//  CoreDataMathGame
//
//  Created by kamila on 03.04.2025.
//

import SwiftUI

struct TestLocalizations: View {
    var body: some View {
        VStack {
            Text("Game over")
            Text("Score")
            Text("Level")
            Text("Game")
            Text("Rank")
            Text("High scores")
            Text("Name")
            Text("Save")
        }
        .font(.title)
    }
}

struct TestLocalizations_Previews: PreviewProvider {
    static var previews: some View {
        TestLocalizations()
    }
}
