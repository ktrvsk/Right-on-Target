//
//  ViewController.swift
//  Right on Target
//
//  Created by Ksusha on 28.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var game: Game!
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let generator = NumberGenerator(startValue: 1, endValue: 50)!
        game = Game(valueGenerator: generator, rounds: 5)
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
    }
    
    @IBAction func checkNumber() {
        game.currentRound.calculateScore(with: Int(slider.value))

        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
    }
    
    private func updateLabelWithSecretNumber(newText: String ) {
        label.text = newText
    }
    
    private func showAlertWith(score: Int) {
    let alert = UIAlertController(title: "Game over", message: "Your score: \(score)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "New game", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

