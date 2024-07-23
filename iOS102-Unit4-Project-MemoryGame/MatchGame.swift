//
//  MatchGame.swift
//  iOS102-Unit4-Project-MemoryGame
//
//  Created by Raymond Chen on 7/20/24.
//

import Observation
import Foundation

@Observable class MatchGame {
    private(set) var cards: [Card]
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        didSet {
            if let index = indexOfTheOneAndOnlyFaceUpCard {
                if cards[index].isMatched == false {
                    flipCard(at: index)
                }
            }
        }
    }
    
    init() {
        cards = Card.mockedCards + Card.mockedCards
        cards.shuffle()
    }
    
    
    func choose(_ chosenIndex: Int) {
           if !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            flipCard(at: chosenIndex)
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard, chosenIndex != potentialMatchIndex {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            
        }
    }
    
    private func flipCard(at index: Int) {
        cards[index].isFaceUp.toggle()
    }

}
