//
//  Set.swift
//  Set Game
//
//  Created by Cristina Mihaela on 25.02.2022.
//

import Foundation

struct SetGame {
    var cards = [Card]()
    var indexOfcurrentCard = 0
    var score = 0
    var displayedCards: [Card] = []

    var selectedCards = [Card]()

    var matchedSets = Set<Set<Card>> ()

    lazy var sets: Set<[[Card]]> = []

    init() {
        for symbol in Card.Symbol.allCases {
            for color in Card.Color.allCases {
                for shading in Card.Shading.allCases {
                    for number in 0..<3{
                        cards.append(Card(symbol: symbol, color: color, number: number, shading: shading))
                    }
                }
            }
        }
        cards = cards.shuffled()
        // hash sets don't care about order
        var test1: Set<Card> = [Card(symbol: .triangle, color: .red, number: 1, shading: .filled), Card(symbol: .square, color: .green, number: 0, shading: .striped), Card(symbol: .oval, color: .purple, number: 2, shading: .outlines)]
        var test2: Set<Card> = [Card(symbol: .oval, color: .purple, number: 2, shading: .outlines), Card(symbol: .triangle, color: .red, number: 1, shading: .filled), Card(symbol: .square, color: .green, number: 0, shading: .striped)]
        print(test1.hashValue)
        print(test2.hashValue)

    }


    mutating func checkMatchingCards(){
        if (selectedCards[0].symbol.rawValue + selectedCards[1].symbol.rawValue + selectedCards[2].symbol.rawValue) % 3 == 0 {
//            if (selectedCards[0].shading.rawValue + selectedCards[1].shading.rawValue + selectedCards[2].shading.rawValue) % 3 == 0 {
//                if (selectedCards[0].color.rawValue + selectedCards[1].color.rawValue + selectedCards[2].color.rawValue) % 3 == 0 {
//                    if (selectedCards[0].number + selectedCards[1].number + selectedCards[2].number) % 3 == 0 {
                        if !matchedSets.contains(Set<Card>(selectedCards)) {
                            score += 1
                            matchedSets.insert(Set<Card>(selectedCards))
                            //sets.insert(matchedSets)
                        } else {
                            print("Set already found")
                        }

//                    }
//                }
//            }
        } else {
            selectedCards.removeAll()

        }
        print("checkMatchingCards() was called, score: \(score)")
        print("selectedCards: \(selectedCards)")
        print("matchedSets: \(matchedSets.count)")
    }

}
