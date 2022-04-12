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
        UserDefaults.standard.latestPage = Float(latestPage.text ?? "0")
        print(UserDefaults.standard.latestPage)
        updateStreak()
        
        navigationManager.show(screen: .goHome, inController: self)
    }
    
    @IBAction func finishReadingGoalPressed(_ sender: UIButton) {
        UserDefaults.standard.latestPage = Float(UserDefaults.standard.userGoal?.totalPages ?? "100")
        print(UserDefaults.standard.latestPage)
        navigationManager.show(screen: .goHome, inController: self)
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
    
}
