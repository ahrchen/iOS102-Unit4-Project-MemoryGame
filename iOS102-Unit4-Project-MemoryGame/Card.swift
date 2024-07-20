//
//  Card.swift
//  iOS102-Unit4-Project-MemoryGame
//
//  Created by Raymond Chen on 7/19/24.
//

import Foundation

struct Card: Equatable, Identifiable {
    var id: UUID = UUID()
    let content: String
    var isFaceUp:Bool = false
    
    static let mockedCards = [Card(content: "☀️"),
                              Card(content: "🌧️"),
                              Card(content: "🚘"),
                              Card(content: "📍"),
                              Card(content: "🛁")
                            ]
}
