//
//  ViewController.swift
//  Panek
//
//  Created by Panek on 27/05/2019.
//  Copyright © 2019 Panek Team. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score: Int = 0
    var round: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = (slider.value).rounded()
        updateScore()
        currentValue = Int(roundedValue)
        targetValue = Int.random(in: 1...100)
        updateLabel()
        startNewRound()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlited = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlited, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizeable = trackLeftImage.resizableImage(withCapInsets: insets)
        
        slider.setMinimumTrackImage(trackLeftResizeable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizeable = trackRightImage.resizableImage(withCapInsets: insets)
        
        slider.setMinimumTrackImage(trackRightResizeable, for: .normal)
    }
    
    @IBAction func showAlert() {
        var title = "Perfect"
        let difference = abs(currentValue - targetValue)
        if difference != 0 {
            title = difference > 5 ? "Too far!" : "Close enough!"
        }
        if difference == 0 {
            updateScore(bonus: 100)
        } else if difference == 1 {
            updateScore(bonus: 50)
        } else {
            updateScore(bonus: 0)
        }

        let message = "The value of the slider is \(currentValue)" + "\nThe target value is \(targetValue)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Click", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = (slider.value).rounded()
        currentValue = Int(roundedValue)
    }
    @IBAction func startOver() {
        score = 0
        round = 1
        scoreLabel.text = "Score: \(score)"
        roundLabel.text = "Round: \(round)"
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 25
        slider.value = Float(currentValue)
        updateLabel()
        updateRound()
    }
    
    func updateLabel() {
        label.text = "Put the bull's eye as close as you can to: \(targetValue)"
    }
    
    func updateScore(bonus: Int = 0) {
        score += abs(currentValue - targetValue) + bonus
        scoreLabel.text = "Score: \(score)"
    }
    
    func updateRound() {
        round += 1
        roundLabel.text = "Round: \(round)"
    }
}

