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
    
    var counter = 0
    var randomNumber = 0

    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var numSlider: UISlider!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        randomNumber = Int(arc4random_uniform(101))
        numLabel.text = "Move the slider to : \(randomNumber)"
    }
    
    @IBAction func checkValue(_ sender: Any) {
        if (Int(numSlider.value) < randomNumber) {
            resultLabel.text = "You're too left  \(Int(numSlider.value) - randomNumber)"
            resultLabel.backgroundColor = UIColor.red
        }
        else if (Int(numSlider.value) > randomNumber){
            resultLabel.text = "You're too right \(randomNumber - Int(numSlider.value))"
            resultLabel.backgroundColor = UIColor.red
        }
        else {
            resultLabel.text = "Mata kebo"
            resultLabel.backgroundColor = UIColor.green
            let alert = UIAlertController(title: "Congrats", message: "Mata kebo", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            
            present(alert, animated: true, completion:  nil)
        }
    }
}

