//
//  TitleValueView.swift
//  CoreDataMathGame
//
//  Created by kamila on 03.04.2025.
//

import SwiftUI

struct TitleValueView: View {
    let title: String
    let value: Int
    
    var body: some View {
        VStack {
            Text("\(title)")
            Text("\(value)")
        }
        .fontWeight(.semibold)
        .foregroundStyle(.black)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 30).foregroundColor(.white)
        )
    }
}

struct TitleValueView_Previews: PreviewProvider {
    static var previews: some View {
        TitleValueView(title: "Score", value: 7)
    }
}
