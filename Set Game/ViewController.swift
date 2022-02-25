//
//  ViewController.swift
//  Set Game
//
//  Created by Cristina Mihaela on 25.02.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setBorders()
    }


    @IBOutlet var cardButtons: [UIButton]!

    @IBAction func dealButton(_ sender: UIButton) {
    }

    @IBAction func newGameButton(_ sender: UIButton) {
    }
    
    @IBOutlet weak var scoreLabel: UILabel!

    func setBorders() {
        for button in cardButtons {
            button.layer.borderWidth = 3.0
            button.layer.borderColor = UIColor.blue.cgColor
        }
    }

}

