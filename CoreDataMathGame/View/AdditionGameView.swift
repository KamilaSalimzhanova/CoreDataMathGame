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
                Text("Scores")
                
            }
        }
    }
}

struct AdditionGameView_Previews: PreviewProvider {
    static var previews: some View {
        AdditionGameView()
    }
}
