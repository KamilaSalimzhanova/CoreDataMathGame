//
//  ContentView.swift
//  CoreDataMathGame
//
//  Created by kamila on 03.04.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AdditionGameView()
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Game")
                }
            HighScoreView()
                .tabItem {
                    Image(systemName: "list.number")
                    Text("Rating")
                }
        }
        .tint(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
