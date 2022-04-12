//
//  LatestPageViewController.swift
//  Atomic Team 3
//
//  Created by Hafizh Mo on 06/04/22.
//

import Foundation
import UIKit
import AVFoundation

class LatestPageViewController: UIViewController {
    @IBOutlet weak var whiteCard: UIView!
    @IBOutlet weak var latestPage: UITextField!
    private var navigationManager = NavigationManager()
    
    let today: Date = Date()
    var count: Int!
    var lastDate: Date!
    
    var player: AVAudioPlayer?

    func playSound(soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    override func viewDidLoad() {
        playSound(soundName: "finish")
        whiteCard.layer.cornerRadius = 10
        self.dismissKeyboard()
        
        count = UserDefaults.standard.userStreak?.count ?? 1
        lastDate = UserDefaults.standard.userStreak?.lastDate ?? today
    }
    
    @IBAction func updateMyProgressPressed(_ sender: UIButton) {
        
        let latestPage = latestPage.text ?? ""
        
        // check if latest pages is empty
        if latestPage.isEmpty == true {
            showToast(message: "Latest pages must be filled")
            return
        }
        
        // check if latest pages is numeric
        if Int(latestPage) == nil {
            showToast(message: "Latest pages must be numeric")
            return
        }
        
        // check if latest pages is greater than 0
        if Int(latestPage) ?? 0 <= 0 {
            showToast(message: "Latest pages must be greater than 0")
            return
        }
        
        UserDefaults.standard.latestPage = Float(latestPage)
        updateStreak()
        print("Update progress success")
        
        navigationManager.show(screen: .goHome, inController: self)
    }
    
    @IBAction func finishReadingGoalPressed(_ sender: UIButton) {
        
        // init alert dialog for delete confirmation
        let alertDialog = UIAlertController(title: "Complete your goal?", message: "Once you complete, your progress so far will be set as accomplished", preferredStyle: .alert)
        
        // Back button action handler
        let backButton = UIAlertAction(title: "Back", style: .cancel, handler: nil)
        
        // Complete button action handler
        let confirmDeleteButton = UIAlertAction(title: "Complete", style: .default, handler: {
            action in
//            UserDefaults.standard.latestPage = Float(UserDefaults.standard.userGoal?.totalPages ?? "100")
//            print(UserDefaults.standard.latestPage)
//            self.navigationManager.show(screen: .goHome, inController: self)
            
            self.deleteGoal()
        })
            
        alertDialog.addAction(backButton)
        alertDialog.addAction(confirmDeleteButton)
        
        // present alert dialog
        self.present(alertDialog, animated: true, completion: nil)
    }
    
    private func reset() {
        let streak = Streak(count: 1, lastDate: today)
        UserDefaults.standard.userStreak = streak
    }

    private func increase() {
        count += 1
        let streak = Streak(count: count, lastDate: today)
        UserDefaults.standard.userStreak = streak
    }

    private func initial() {
        let streak = Streak(count: count, lastDate: lastDate)
        UserDefaults.standard.userStreak = streak
    }

    private func updateStreak(){
        if Calendar.current.isDateInToday(lastDate) {
            initial()
        } else if Calendar.current.isDateInYesterday(lastDate) {
            increase()
        } else {
            reset()
        }
    }
    
    func deleteGoal() {
        // delete the goal & redirected to home
        UserDefaults.standard.userGoal = nil
        UserDefaults.standard.latestPage = nil
        navigationManager.show(screen: .completeGoal, inController: self)
    }
    
    func showToast(message: String){
            
        let toastMsg = UILabel()
        toastMsg.text = message
        toastMsg.textAlignment = .center;
        toastMsg.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastMsg.textColor = UIColor.white
        toastMsg.numberOfLines = 0
        toastMsg.font = UIFont.systemFont(ofSize: 15)
        
        let textSize = toastMsg.intrinsicContentSize
        let toastWidth = min(textSize.width, self.view.frame.size.height-150)
        
        toastMsg.frame = CGRect(x: self.view.frame.size.width/2-(textSize.width/2)-25, y: self.view.frame.size.height-150, width: toastWidth + 50, height: textSize.height + 10)
        toastMsg.alpha = 1.0
        toastMsg.layer.cornerRadius = 10;
        toastMsg.clipsToBounds = true
        self.view.addSubview(toastMsg)
            
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastMsg.alpha = 0.0
        }, completion: {(isCompleted) in
            toastMsg.removeFromSuperview()
        })
    }
}
