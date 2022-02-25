//
//  Card.swift
//  Set Game
//
//  Created by Cristina Mihaela on 25.02.2022.
//

import Foundation
import UIKit

struct Card {

    var symbol: Symbol
    var color: Color
    var number: Number
    var shading: Shading

    var isDisplayed = false
    var isMatched = false
}

enum Symbol {
    case diamond, squiggle, oval
}

enum Color {
    case red, green, purple
}

enum Number: Int {
    case one = 1
    case two
    case three
}

enum Shading {
    case filled, outlines, striped
}
