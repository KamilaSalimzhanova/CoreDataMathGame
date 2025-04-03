//
//  RankScoreView.swift
//  CoreDataMathGame
//
//  Created by kamila on 04.04.2025.
//

import SwiftUI

struct RankScoreView: View {
    @EnvironmentObject var highScoreViewModel: HighScoreViewModel
    @State private var editMode = false
    @State private var save = false
    @State private var name: String = ""
    let rank: Int
    let score: Int
    let entity: HighScoreEntity
    
    private let scoreColors: [Color] = [.pink, .orange, .purple, .yellow, .red]
    private var color: Color { scoreColors[(rank-1) % scoreColors.count] }
    var body: some View {
        VStack {
            if editMode {
                HStack {
                    TextField(entity.name ?? "name", text: $name)
                        .padding()
                        .background(.pink.gradient)
                        .padding()
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .cornerRadius(15)
                    
                    Button {
                        highScoreViewModel.updateEntity(entity, newName: name.isEmpty ? (entity.name ?? "") : name)
                        withAnimation {
                            editMode.toggle()
                        }
                    } label: {
                        Text("Save")
                            .foregroundColor(.white)
                            .padding()
                            .background(.red.gradient)
                            .cornerRadius(15)
                    }
                }
            }
            else {
                HStack {
                    Text(rank.ordinal)
                        .frame(maxWidth: .infinity)
                        .minimumScaleFactor(0.3)
                    Text("\(score)")
                        .frame(maxWidth: .infinity)
                        .minimumScaleFactor(0.3)
                    Text(entity.name?.uppercased() ?? "")
                        .frame(maxWidth: .infinity)
                        .minimumScaleFactor(0.3)
                }
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(color)
                .onTapGesture {
                    withAnimation {
                        editMode.toggle()
                    }
                }
            }
        }
    }
}

struct RankScoreView_Previews: PreviewProvider {
    static var previews: some View {
        RankScoreView(rank: 1, score: 7, entity: HighScoreEntity(context: PersistenceController.shared.viewContext)).environmentObject(HighScoreViewModel())
    }
}
