//
//  LatestPageViewController.swift
//  Atomic Team 3
//
//  Created by Hafizh Mo on 06/04/22.
//

import Foundation
import UIKit

class LatestPageViewController: UIViewController {
    @IBOutlet weak var whiteCard: UIView!
    @IBOutlet weak var latestPage: UITextField!
    private var navigationManager = NavigationManager()
    
    let today: Date = Date()
    var count: Int!
    var lastDate: Date!
    
    override func viewDidLoad() {
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
