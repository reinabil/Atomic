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
        readingTimeTargetPicker.countDownDuration = UserDefaults.standard.userGoal?.timeTarget ?? 900
    }
    
    override func viewWillAppear(_ animated: Bool) {
        bookTitleTextField.borderStyle = UITextField.BorderStyle.roundedRect
        totalPagesTextField.borderStyle = UITextField.BorderStyle.roundedRect
    }
    
    
    @IBAction func updateButtonPressed(_ sender: Any) {
        
        let bookTitle = bookTitleTextField.text ?? "Atomic Book"
        let totalPages = totalPagesTextField.text ?? "538"
        let updatedTimeTarget = readingTimeTargetPicker.countDownDuration

        // check if updated time target is more than or equals to 15 minutes
        if updatedTimeTarget >= 900 {
            
            let updatedGoal = Goal(bookTitle: bookTitle, totalPages: totalPages, timeTarget: updatedTimeTarget)
            
            UserDefaults.standard.userGoal = updatedGoal
            print("Edit goal success")
            
        } else {
            
            showToast(message: "Time target must be more than 15 minutes")
            return
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
        UserDefaults.standard.latestPage = nil
        navigationManager.show(screen: .firstTime, inController: self)
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
        
        toastMsg.frame = CGRect(x: self.view.frame.size.width/2-(textSize.width/2)-25, y: self.view.frame.size.height-185, width: toastWidth + 50, height: textSize.height + 10)
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
