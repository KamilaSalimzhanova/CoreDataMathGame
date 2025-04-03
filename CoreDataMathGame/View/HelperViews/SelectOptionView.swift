//
//  SelectOptionView.swift
//  CoreDataMathGame
//
//  Created by kamila on 04.04.2025.
//

import SwiftUI

struct SelectOptionView: View {
    @State private var selectedOption: Int? = nil
    let option: Int
    let vm: AdditionGameViewModel
    
    private var isSelected: Bool { selectedOption == option }
    private var scale: CGFloat { isSelected ? 1.2 : 1.0 }
    private var color: Color {
        isSelected ? [.green.opacity(0.5), .red.opacity(0.5), .blue.opacity(0.5), .orange.opacity(0.5)].randomElement() ?? .green.opacity(0.5) : .purple.opacity(0.5)
    }
    var body: some View {
        BubbleView(textColor: .black, backgroundColor: color, text: "\(option)", name: "bubble2", bubbleSize: 80)
            .scaleEffect(scale)
            .onTapGesture {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.3).repeatCount(1, autoreverses: true)) {
                    selectedOption = option
                }
                DispatchQueue.main.asyncAfter(deadline: .now()+0.1){
                    withAnimation {
                        selectedOption = nil
                    }
                }
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

struct SelectOptionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectOptionView(option: 1, vm: AdditionGameViewModel())
    }
}
