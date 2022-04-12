//
//  HomeViewController1.swift
//  Atomic Team 3
//
//  Created by Nabil Rei on 11/04/22.
//

import Foundation
import UIKit

class SettedHomeViewController: UIViewController{
    
    @IBOutlet weak var progressBar1: ProgressBar!
    @IBOutlet weak var bookProgress: UILabel!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var streakCard: UIView!
    @IBOutlet weak var goalEmptyCard: UIView!
    @IBOutlet weak var pagesProgress: UILabel!
    var totalPages: Float?
    var latestPage: Float?
    var userProgress: Float?
    private let navigationManager = NavigationManager()
    
    @IBOutlet weak var labelCurrentStreak: UILabel!
    @IBOutlet weak var btnDay1: UIButton!
    @IBOutlet weak var btnDay2: UIButton!
    @IBOutlet weak var btnDay3: UIButton!
    @IBOutlet weak var btnDay4: UIButton!
    @IBOutlet weak var btnDay5: UIButton!
    @IBOutlet weak var btnDay6: UIButton!
    @IBOutlet weak var btnDay7: UIButton!
    
    var countFired: CGFloat = 0
    
    override func viewDidLoad() {
        
        
        
//        print(UserDefaults.standard.float(forKey: "timeTarget"))
//        print(UserDefaults.standard.integer(forKey: "totalPages"))
//        print(UserDefaults.standard.string(forKey: "bookTitle") ?? "")
        
        if UserDefaults.standard.userGoal != nil {
            totalPages = Float(UserDefaults.standard.userGoal!.totalPages)
            pagesProgress.text = "\(Int(UserDefaults.standard.latestPage!))/\(Int(UserDefaults.standard.userGoal!.totalPages)!) pages"
        } else {
            totalPages = 0
        }
        
        latestPage = Float(UserDefaults.standard.latestPage!)
        
        userProgress = ((latestPage ?? 0)/totalPages! ?? 0) * 100
        
        bookProgress.text = String(format: "%.0f", userProgress!) + "%"
        bookTitle.text = UserDefaults.standard.userGoal?.bookTitle
        
        progressBar1.progress = CGFloat((latestPage! ?? 0) / (totalPages! ?? 0))
        
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
    
    @IBAction func editGoalsPressed(_ sender: UIButton) {
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
    
    private func showCase() {
      Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
        self.countFired += 1
        
        DispatchQueue.main.async {
          self.progressBar1.progress = min(CGFloat(0.04 * self.countFired), 1)
        }
      }
    }
    @IBAction func completePressed(_ sender: UIButton) {
        // init alert dialog for delete confirmation
        let alertDialog = UIAlertController(title: "Complete your goal?", message: "Once you complete, your progress so far will be set as accomplished", preferredStyle: .alert)
        
        // Back button action handler
        let backButton = UIAlertAction(title: "Back", style: .cancel, handler: nil)
        
        // Yes, delete button action handler
        let confirmDeleteButton = UIAlertAction(title: "Complete", style: .default, handler: {
            action in
            self.deleteGoal()
            
        })
        
        alertDialog.addAction(backButton)
        alertDialog.addAction(confirmDeleteButton)
        
        // present alert dialog
        self.present(alertDialog, animated: true, completion: nil)
    }
    
    func deleteGoal() {
        // delete the goal & redirected to home
        UserDefaults.standard.userGoal = nil
        UserDefaults.standard.latestPage = nil
        navigationManager.show(screen: .completeGoal, inController: self)
    }
}
