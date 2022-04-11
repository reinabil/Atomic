//
//  HomeViewController1.swift
//  Atomic Team 3
//
//  Created by Nabil Rei on 11/04/22.
//

import Foundation
import UIKit

class SettedHomeViewController: UIViewController{
    @IBOutlet weak var bookProgress: UILabel!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var streakCard: UIView!
    @IBOutlet weak var goalEmptyCard: UIView!
    var totalPages: Float?
    var latestPage: Float?
    var userProgress: Float?
    
    override func viewDidLoad() {
        
//        print(UserDefaults.standard.float(forKey: "timeTarget"))
//        print(UserDefaults.standard.integer(forKey: "totalPages"))
//        print(UserDefaults.standard.string(forKey: "bookTitle") ?? "")
        
        if UserDefaults.standard.userGoal != nil {
            totalPages = Float(UserDefaults.standard.userGoal!.totalPages)
        } else {
            totalPages = 0
        }
        
        latestPage = Float(UserDefaults.standard.latestPage!)
        
        userProgress = ((latestPage ?? 0)/totalPages! ?? 0) * 100
        
        bookProgress.text = String(format: "%.0f", userProgress!) + "%"
        bookTitle.text = UserDefaults.standard.userGoal?.bookTitle
        
        
        streakCard.layer.cornerRadius = 10
        goalEmptyCard.layer.cornerRadius = 10
        
    }
    @IBAction func editGoalsPressed(_ sender: UIButton) {
    }
}
