//
//  ViewController.swift
//  Bullseye
//
//  Created by Octavian Wisnu on 7/15/1 R.
//  Copyright © 1 Octavian Metta. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    var randomNumber = 0
    var currentValue = 0
    var round = 0
    var score = 0

    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var numSlider: UISlider!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       startNewRound()
    }
    

    @IBAction func sliderMoved(_ sender: UISlider) {
        currentValue = Int(numSlider.value.rounded())
    }
    
    @IBAction func checkValue(_ sender: Any) {
        var title: String
        var message: String
        let differences = abs(currentValue - randomNumber)
        if (Int(numSlider.value) < randomNumber) {
            title = "Whoops"
            message = "You're too left \(differences)"
        }
        else if (Int(numSlider.value) > randomNumber){
            title = "Whoops"
            message = "You're too right \(differences)"
        }
        else {
            title = "Mata kebo"
            message = "You did it"
            
        }
        score = score + (100 - differences)
        scoreLabel.text = "\(score)"
        showAlertDialog(title, message)
        startNewRound()
    }
    
    @IBAction func playAgain(_ sender: Any) {
        playAgain()
    }
    
    fileprivate func showAlertDialog(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion:  nil)
    }
    
    func startNewRound() {
        randomNumber = Int.random(in: 1...100)
        round += 1
        updateLabel()
    }
    
    func playAgain(){
        numSlider.value = 50
        randomNumber = Int.random(in: 1...100)
        round = 0
        score = 0
        updateLabel()
    }
    
    func updateLabel(){
        numLabel.text = "Move the slider to : \(randomNumber)"
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

