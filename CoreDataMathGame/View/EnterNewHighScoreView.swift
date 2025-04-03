//
//  EnterNewHighScoreView.swift
//  CoreDataMathGame
//
//  Created by kamila on 04.04.2025.
//

import SwiftUI

struct EnterNewHighScoreView: View {
    @EnvironmentObject private var hsVM: HighScoreViewModel
    @Binding var name: String
    @Binding var isPresented: Bool
    let score: Int
    var body: some View {
        ZStack {
            HighScoreBackgroundView()
            VStack {
                Text("New high score" + ": \(score)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.1)
                TextField("Enter name", text: $name)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding()
                    .autocorrectionDisabled(true)
                    .background(.white)
                    .cornerRadius(20)
                    .padding()
                Button {
                    name = name.isEmpty ? "Anonymous" : name
                    hsVM.addHighScore(name: name, highScore: Int64(score))
                    isPresented = false
                } label: {
                    Label("Save", systemImage: "square.and.arrow.down.fill")
                        .font(.title)
                        .foregroundStyle(.black)
                        .padding()
                }

            }
        }
    }
}

struct EnterNewHighScoreView_Previews: PreviewProvider {
    static var previews: some View {
        EnterNewHighScoreView(name: .constant(""), isPresented: .constant(true), score: 123).environmentObject(HighScoreViewModel())
    }
}
