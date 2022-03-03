//
//  Card.swift
//  Set Game
//
//  Created by Cristina Mihaela on 25.02.2022.
//

import Foundation
import UIKit

struct Card: Equatable, CustomStringConvertible, Hashable {

    var symbol: Symbol
    var color: Color
    var number: Int
    var shading: Shading

    var isDisplayed = false
    var isSelected = false
    var isMatched = false

    var identifier: Int = 0
    private static var identifierFactory = 0

    private static func getUniqueIdentifier () -> Int {
        identifierFactory += 1
        return identifierFactory
    }

    var description: String {
        return "\(self.symbol);\(self.color);\(self.number);\(self.shading)"
    }

    enum Symbol: Int, CustomStringConvertible, CaseIterable { // caseiterable = no more var all[]
        case triangle
        case square
        case oval
        var description: String {
            switch self {
            case .triangle: return "▲"
            case .square: return "■"
            case .oval: return "●"
            }
        }
    }


    enum Color: Int, CaseIterable {
        case red
        case green
        case purple
        //static var all = [Color.red,.purple,.green]
        var description: UIColor {
            switch self {
            case .red: return UIColor.red
            case .green: return UIColor.green
            case .purple: return UIColor.purple
            }
        }
    }

    enum Shading: Int, CaseIterable {
        case filled
        case outlines
        case striped

        var description: CGFloat {
            switch self {
            case .filled: return 1.0
            case .outlines: return 0.0
            case .striped: return 0.15
            }
        }
    }
}

