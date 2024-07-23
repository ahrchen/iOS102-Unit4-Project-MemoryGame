//
//  ContentView.swift
//  iOS102-Unit4-Project-MemoryGame
//
//  Created by Raymond Chen on 7/19/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(MatchGame.self) var matchGame
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(0 ..<
                    matchGame.cards.count, id: \.self) { index in
                    CardView( cardIndex: index)
                            .environment(matchGame)
                }
            }
            .padding(20)
            
        }
        .animation(.bouncy, value: matchGame.cards)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .topTrailing) {
            Button("Reset", systemImage: "restart") {
                matchGame.reset()
            }
        }
        
      
    }
}

#Preview {
    ContentView()
        .environment(MatchGame())
}
