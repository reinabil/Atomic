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
    @IBOutlet weak var TimerLabel: UILabel!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    var isPlay = false
    
    var timer:Timer = Timer()
    var count:Float =  Float(UserDefaults.standard.userGoal?.timeTarget ?? 60) // TIMER VALUE IN SECONDS
    var timerCounting:Bool = false
    var countLet:Float?
    private let navigationManager = NavigationManager()
   
    override func viewDidLoad() {
    
        countLet = count
        
        // WHITE VIEW RADIUS CORNER
        whiteView.layer.cornerRadius = 10
        
        // GREY BACKGROUND
        self.view.backgroundColor = UIColor(named: "grey_bg")
        
        // PROGRESS BAR HEIGHT
        progressTimer.transform = progressTimer.transform.scaledBy(x: 1, y: 8)
        
        // PLAY BUTTON INITIAL
        if !timerCounting {
            playButton.setImage(UIImage(systemName: "play"), for: .normal)
            playButton.setTitle("Play", for: .normal)
        } else {
            playButton.setImage(UIImage(systemName: "pause"), for: .normal)
            playButton.setTitle("Pause", for: .normal)
        }
        
        // TIMER LABEL INITIAL
        let time = secondsToHoursMinutesSeconds(seconds: Int(count))
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        TimerLabel.text = timeString
        
        super.viewDidLoad()
        progressTimer.progress = count/count
    }

    
    @IBAction func playPressed(_ sender: UIButton) {
        
        // TIMER PLAY
        if timerCounting {
            timerCounting = false
            timer.invalidate()
            
            playButton.setImage(UIImage(systemName: "play"), for: .normal)
            playButton.setTitle("Play", for: .normal)
            headlineLabel.text = "Continue your progress!"
            subLabel.text = "Keep reading"
        } else {
            timerCounting = true
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
            
            playButton.setImage(UIImage(systemName: "pause"), for: .normal)
            playButton.setTitle("Pause", for: .normal)
            headlineLabel.text = "You are doing great!"
            subLabel.text = "Keep up the progress"
        }
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        self.timer.invalidate()
        // init alert dialog for delete confirmation
        let alertDialog = UIAlertController(title: "Cancel the timer?", message: "Your recorded time will be cancelled", preferredStyle: .alert)
        
        // Back button action handler
        let backButton = UIAlertAction(title: "Back", style: .cancel, handler: {_ in
            self.playPressed(self.playButton)
        })
        
        // Yes, delete button action handler
        let confirmDeleteButton = UIAlertAction(title: "Yes, cancel", style: .destructive, handler: {
            action in
            
            self.navigationController?.popViewController(animated: true)
            self.dismiss(animated: true, completion: nil)
        })
        
        alertDialog.addAction(backButton)
        alertDialog.addAction(confirmDeleteButton)
        
        // present alert dialog
        self.present(alertDialog, animated: true, completion: nil)
        
        
    }
    
    @objc func timerCounter() -> Void
    {
        // PROGRESS BAR UPDATE
        self.progressTimer.setProgress((count-1)/(countLet ?? 0.0), animated: true)
        
        if count >= 1 {
            count = count - 1
            let time = secondsToHoursMinutesSeconds(seconds: Int(count))
            let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
            TimerLabel.text = timeString
            print(timeString)
            print(progressTimer.progress)
        } else if count == 0 {
            
            // ACTION : CONGRATS
            navigationManager.show(screen: .finish, inController: self)
            timer.invalidate()
            print("SELESAI")
            
        }
    }
    
    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int)
        {
            return ((seconds / 3600), (seconds / 60) ,((seconds % 3600) % 60))
            ((seconds % 3600) / 60)
        }
        
        func makeTimeString(hours: Int, minutes: Int, seconds : Int) -> String
        {
            var timeString = ""
            timeString += String(format: "%02d", minutes)
            timeString += ":"
            timeString += String(format: "%02d", seconds)
            return timeString
        }
    
    func deleteGoal() {
        // delete the goal & redirected to home
        UserDefaults.standard.userGoal = nil
        UserDefaults.standard.latestPage = nil
        navigationManager.show(screen: .firstTime, inController: self)
    }
    
 }




