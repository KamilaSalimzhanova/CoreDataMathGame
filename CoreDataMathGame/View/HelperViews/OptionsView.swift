//
//  OptionsView.swift
//  CoreDataMathGame
//
//  Created by kamila on 03.04.2025.
//

import SwiftUI

struct OptionsView: View {
    let vm: AdditionGameViewModel
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(vm.possibleSolutions, id:\.self) { option in
                
              //  let cheatColor: Color = (option == vm.answer ? .red :.black)
                
                BubbleView(textColor: .black, backgroundColor: .purple.opacity(0.7), text: "\(option)", name: "bubble2", bubbleSize: 80)
                    .onTapGesture {
                        if vm.answer == option {
                            vm.increaseScore()
                        } else {
                            vm.loseLife()
                        }
                        withAnimation {
                            vm.generateNumbers()
                        }
                        
                    }
            }
        }
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView(vm: AdditionGameViewModel())
    }
}
