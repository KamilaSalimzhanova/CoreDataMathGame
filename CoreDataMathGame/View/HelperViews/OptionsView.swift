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
                SelectOptionView(option: option, vm: vm)
            }
        }
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView(vm: AdditionGameViewModel())
    }
}
