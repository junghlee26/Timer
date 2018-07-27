//
//  ViewController.swift
//  Timer
//
//  Created by Junghoon Lee on 7/26/18.
//  Copyright © 2018 Junghoon Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    var timer = Timer()
    var counter = 0.0
    var isRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLabel.text = "0.0"
        playButton.isEnabled = true
        pauseButton.isEnabled = false
        
    }
    
    @objc func updateTimer() {
        counter += 0.1
        timeLabel.text = String(format: "%.1f", counter)
    }

    @IBAction func playButtonPressed(_ sender: Any) {
        if !isRunning {
            playButton.isEnabled = false
            pauseButton.isEnabled = true
            isRunning = true
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func pauseButtonPressed(_ sender: Any) {
        timer.invalidate()
        isRunning = false
        
        playButton.isEnabled = true
        pauseButton.isEnabled = false
        
    }
    

    @IBAction func resetButtonPressed(_ sender: Any) {
        timer.invalidate()
        isRunning = false
        timeLabel.text = "0"
        
        playButton.isEnabled = true
        pauseButton.isEnabled = false
    }
    
}

