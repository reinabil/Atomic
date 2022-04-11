//
//  EditGoalViewController.swift
//  Atomic Team 3
//
//  Created by Minawati on 06/04/22.
//

import Foundation
import UIKit

class EditGoalViewController: UIViewController {
    
    @IBOutlet weak var bookTitleTextField: UITextField!
    @IBOutlet weak var totalPagesTextField: UITextField!
    @IBOutlet weak var readingTimeTargetPicker: UIDatePicker!
    var navigationManager = NavigationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookTitleTextField.text = UserDefaults.standard.userGoal?.bookTitle
        totalPagesTextField.text = UserDefaults.standard.userGoal?.totalPages
        readingTimeTargetPicker.countDownDuration = UserDefaults.standard.userGoal?.timeTarget ?? 60
    }
    
    override func viewWillAppear(_ animated: Bool) {
        bookTitleTextField.borderStyle = UITextField.BorderStyle.roundedRect
        totalPagesTextField.borderStyle = UITextField.BorderStyle.roundedRect
    }
    
    
    @IBAction func updateButtonPressed(_ sender: Any) {
        
        let bookTitle = bookTitleTextField.text ?? "Atomic Book"
        let totalPages = totalPagesTextField.text ?? "538"
        let updatedTimeTarget = readingTimeTargetPicker.countDownDuration
        
        if updatedTimeTarget >= 900 {
            
            let updatedGoal = Goal(bookTitle: bookTitle, totalPages: totalPages, timeTarget: updatedTimeTarget)
            
            UserDefaults.standard.userGoal = updatedGoal
        }
        
        navigationController?.popViewController(animated: true)

        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
         
        // init alert dialog for delete confirmation
        let alertDialog = UIAlertController(title: "Delete goal?", message: "Once you delete, you'll lose all your progress so far", preferredStyle: .alert)
        
        // Back button action handler
        let backButton = UIAlertAction(title: "Back", style: .cancel, handler: nil)
        
        // Yes, delete button action handler
        let confirmDeleteButton = UIAlertAction(title: "Yes, delete", style: .destructive, handler: {
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
        navigationManager.show(screen: .firstTime, inController: self)
    }
}
