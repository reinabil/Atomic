//
//  SetGoalViewController.swift
//  Atomic Team 3
//
//  Created by Minawati on 06/04/22.
//

import Foundation
import UIKit

class SetGoalViewController: UIViewController {
    
    @IBOutlet weak var bookTitleTextField: UITextField!
    @IBOutlet weak var totalPagesTextField: UITextField!
    @IBOutlet weak var readingTimeTargetPicker: UIDatePicker!
    
    private var navigationManager = NavigationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // set error untuk text field
    @IBAction func createGoalButtonPressed(_ sender: Any) {
        
        // check if bookTitle is empty
        guard let bookTitle = bookTitleTextField.text, bookTitleTextField.text?.isEmpty == false else {
            print("Book title is empty")
            return
        }

        // check if totalPages is empty
        guard let totalPages = totalPagesTextField.text, totalPagesTextField.text?.isEmpty == false else {
            print("Total pages is empty")
            return
        }
        
        let timeTarget = readingTimeTargetPicker.countDownDuration
        
        // validate if totalPages have value more than 0 && time target is more than 15 minutes
        if Int(totalPages) ?? 0 > 0 && timeTarget >= 900 {

            let goal = Goal(bookTitle: bookTitle, totalPages: totalPages, timeTarget: timeTarget)
            UserDefaults.standard.userGoal = goal
            
//            UserDefaults.standard.set(timeTarget, forKey: "timeTarget")
//            UserDefaults.standard.set(totalPages, forKey: "totalPages")
//            UserDefaults.standard.set(bookTitle, forKey: "bookTitle")
         
            
            UserDefaults.standard.setOnboardingSeen()
            navigationManager.show(screen: .goHome, inController: self)
            
            print("Create goal success")
        
        } else {
            print("Total pages is less than or equal to 0 and time target must be more than 15 minutes")
        }
        
        
       
    }

    override func viewWillAppear(_ animated: Bool) {
        bookTitleTextField.borderStyle = UITextField.BorderStyle.roundedRect
        totalPagesTextField.borderStyle = UITextField.BorderStyle.roundedRect
    }
}
