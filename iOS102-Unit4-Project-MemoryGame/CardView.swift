//
//  CardView.swift
//  iOS102-Unit4-Project-MemoryGame
//
//  Created by Raymond Chen on 7/19/24.
//

import SwiftUI

struct CardView: View {
    @Environment(MatchGame.self) var matchGame: MatchGame
    
    let cardIndex: Int
    
    @State private var flipDegrees = 0.0
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(matchGame.cards[cardIndex].isFaceUp ? Color.white.gradient : Color.blue.gradient)
                .shadow(color: .black, radius: 4, x: -2, y: 2)
                .border(.black, width: 2.0)
                .clipShape(.rect(cornerRadius: 15.0))
                .opacity(matchGame.cards[cardIndex].isMatched ? 0 : 1)
            
            VStack {
                Text(matchGame.cards[cardIndex].isFaceUp ? matchGame.cards[cardIndex].content : "")
            }
            .font(.title)
            .foregroundColor(.white)
            .padding()
        }
        .aspectRatio(2/3, contentMode: .fit)
        .rotation3DEffect(.degrees(flipDegrees), axis: (x: 0, y: 1, z: 0.01)
        )
        .onTapGesture {
            withAnimation(.linear(duration: 0.6)) {
                let wasFaceUp = matchGame.cards[cardIndex].isFaceUp
                matchGame.choose(cardIndex)
                flipDegrees += (wasFaceUp != matchGame.cards[cardIndex].isFaceUp) ? 180 : 0
                    
            }
        }
    }
    
    
}

//#Preview {
////    CardView(card: Card(content: "☀️"))
//}
