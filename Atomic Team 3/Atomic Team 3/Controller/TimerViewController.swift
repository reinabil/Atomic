//
//  TimerViewController.swift
//  Atomic Team 3
//
//  Created by Nabil Rei on 06/04/22.
//

import Foundation
import UIKit

class TimerViewController: UIViewController {
    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var progressTimer: UIProgressView!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    var isPlay = false
    var timerValue: Int? // IN SECOND
    var timer = Timer() // TIMER INITIAL CLASS
    
    override func viewDidLoad() {
        
        // WHITE VIEW RADIUS CORNER
        whiteView.layer.cornerRadius = 10
        
        // GREY BACKGROUND
        self.view.backgroundColor = UIColor(named: "grey_bg")
        
        // PROGRESS BAR HEIGHT
        progressTimer.transform = progressTimer.transform.scaledBy(x: 1, y: 8)
        
        // PLAY BUTTON INITIAL
        if !isPlay {
            playButton.setImage(UIImage(systemName: "play"), for: .normal)
            playButton.setTitle("Play", for: .normal)
        } else {
            playButton.setImage(UIImage(systemName: "pause"), for: .normal)
            playButton.setTitle("Pause", for: .normal)
        }
        
        // TIME INITIAL
        timerValue = 5 // SECONDS
        
        // PROGRESS VIEW
        progressTimer.progress = Float(timerValue!/timerValue!)
        
        super.viewDidLoad()
    }
    @IBAction func playPressed(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        isPlay = !isPlay
        
        if !isPlay {
            playButton.setImage(UIImage(systemName: "play"), for: .normal)
            playButton.setTitle("Play", for: .normal)
        } else {
            playButton.setImage(UIImage(systemName: "pause"), for: .normal)
            playButton.setTitle("Pause", for: .normal)
        }
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
    }
    
    // TIMER FUNCTION RUN
    @objc func timerAction(){
    print("timer fired!")
        timer.invalidate()
        
 }

}


