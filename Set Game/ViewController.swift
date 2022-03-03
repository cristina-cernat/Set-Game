//
//  ViewController.swift
//  Set Game
//
//  Created by Cristina Mihaela on 25.02.2022.
//

import UIKit

class ViewController: UIViewController {

    //var btnTitle = [NSAttributedString]()
    lazy var game = SetGame()
    let font = UIFont.systemFont(ofSize: 36)

    override func viewDidLoad() {
        super.viewDidLoad()

        setButtons()

        for card in game.cards {
            print("\(card)")
        }

        for button in cardButtons {
            if cardButtons.firstIndex(of: button)! < 12 {
                drawCardOn(button: button)
            }
        }
    }

    @IBOutlet var cardButtons: [UIButton]!

    @IBAction func dealButton(_ sender: UIButton) {
        for index in cardButtons.indices {
            if cardButtons[index].isHidden {
                drawCardOn(button: cardButtons[index])
                drawCardOn(button: cardButtons[index + 1])
                drawCardOn(button: cardButtons[index + 2])
                break
            }
        }
    }

    @IBAction func newGameButton(_ sender: UIButton) {
        game = SetGame()
        setButtons()
        for button in cardButtons {
            if cardButtons.firstIndex(of: button)! < 12 {
                drawCardOn(button: button)
            }
        }
        game.score = 0
        updateViewFromModel()

    }

    @IBOutlet weak var scoreLabel: UILabel!

    @IBAction func selectCardButton(_ sender: UIButton) {
        sender.layer.borderColor = UIColor.black.cgColor
        sender.layer.borderWidth = 3.0

        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.selectedCards.append(game.displayedCards[cardNumber])
        }

        if game.selectedCards.count % 3 == 0 {
            game.checkMatchingCards()
            game.selectedCards.removeAll()

            updateViewFromModel()
        }

    }


    func updateViewFromModel() {
        // deselect cards
        for button in cardButtons {
            button.layer.borderWidth = 1.0
            button.layer.borderColor = UIColor.blue.cgColor
        }

        scoreLabel.text = "Score: \(game.score)"
    }

    func drawCardOn(button: UIButton) {
        if let card = game.cards.last {
            game.cards.removeLast()
            button.isHidden = false

            let btnAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: card.color.description.withAlphaComponent(card.shading.description),
                .font: font,
                .strokeWidth: -4.0,
                .strokeColor: card.color.description
            ]
            var symbols = card.symbol.description
            for _ in 0..<card.number {
                symbols += card.symbol.description
            }

            let btnTitle = NSAttributedString(string: symbols, attributes: btnAttributes)
            button.setAttributedTitle(btnTitle, for: .normal)

            game.displayedCards.append(card)
        } else {
            button.isHidden = true
        }
    }



    func setButtons() {
        for button in cardButtons {
            button.layer.borderWidth = 1.0
            button.layer.borderColor = UIColor.blue.cgColor
            button.layer.cornerRadius = 8.0
            button.isHidden = true
        }
    }

}

