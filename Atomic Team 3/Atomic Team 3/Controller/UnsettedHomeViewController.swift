//
//  UnsettedHomeViewController.swift
//  Atomic Team 3
//
//  Created by Hafizh Mo on 06/04/22.
//

import Foundation
import UIKit

class UnsettedHomeViewController: UIViewController{
    private var navigationManager = NavigationManager()
    
    @IBOutlet weak var streakCard: UIView!
    @IBOutlet weak var goalEmptyCard: UIView!
    
    @IBOutlet weak var labelCurrentStreak: UILabel!
    @IBOutlet weak var btnDay1: UIButton!
    @IBOutlet weak var btnDay2: UIButton!
    @IBOutlet weak var btnDay3: UIButton!
    @IBOutlet weak var btnDay4: UIButton!
    @IBOutlet weak var btnDay5: UIButton!
    @IBOutlet weak var btnDay6: UIButton!
    @IBOutlet weak var btnDay7: UIButton!
    
    override func viewDidLoad() {
        streakCard.layer.cornerRadius = 10
        goalEmptyCard.layer.cornerRadius = 10
        
        let tempDate = UserDefaults.standard.userStreak?.lastDate ?? Date()
        let count = UserDefaults.standard.userStreak?.count ?? 0
        
        let streak = count%7
        let week = count/8

        if count != 0 {
            passedUI(countt: streak)
        }

        if Calendar.current.isDateInYesterday(tempDate) {
            activeUI(count: streak)
        }

        if Calendar.current.isDateInToday(tempDate) && count == 0 {
            btnDay1.current(count: count)
        }
        
        labelCurrentStreak.text = "\(count) Day / Week \(week+1)"
    }
    
    @IBAction func setGoalPressed(_ sender: UIButton) {
        navigationManager.show(screen: .setGoal, inController: self)
    }
    
    private func passedUI(countt: Int) {
        let count = countt - 1
        
        btnDay1.passed()
        if count == 0 {
            return
        }
        
        btnDay2.passed()
        if count == 1 {
            return
        }
        
        btnDay3.passed()
        if count == 2 {
            return
        }
        
        btnDay4.passed()
        if count == 3 {
            return
        }
        
        btnDay5.passed()
        if count == 4 {
            return
        }
        
        btnDay6.passed()
        if count == 5 {
            return
        }
        
        btnDay7.passed()
    }
    
    private func activeUI(count: Int) {
        
        switch count{
        case 0:
            btnDay1.current(count: count)
        case 1:
            btnDay2.current(count: count)
        case 2:
            btnDay3.current(count: count)
        case 3:
            btnDay4.current(count: count)
        case 4:
            btnDay5.current(count: count)
        case 5:
            btnDay6.current(count: count)
        case 6:
            btnDay7.current(count: count)
        default:
            print("nothing...")
        }
    }
}
