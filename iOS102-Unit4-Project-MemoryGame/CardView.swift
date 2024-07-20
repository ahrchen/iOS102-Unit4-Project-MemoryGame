//
//  CardView.swift
//  iOS102-Unit4-Project-MemoryGame
//
//  Created by Raymond Chen on 7/19/24.
//

import SwiftUI

struct CardView: View {
    
    let card: Card
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.blue.gradient)
                .shadow(color: .black, radius: 4, x: -2, y: 2)
            VStack {
                Text(card.content)
            }
            .font(.title)
            .foregroundColor(.white)
            .padding()
        }
        .aspectRatio(2/3, contentMode: .fit)
    }

    
}
#Preview {
    CardView(card: Card(content: "☀️"))
}
