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
        .fontWeight(.bold)
        .foregroundStyle(.primary)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25).foregroundColor(.white)
                .shadow(color: .pink.opacity(0.5), radius: 10)
        )
    }
}

struct TitleValueView_Previews: PreviewProvider {
    static var previews: some View {
        TitleValueView(title: "Score", value: 7)
    }
}
