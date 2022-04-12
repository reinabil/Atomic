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
        self.dismissKeyboard()
    }
    
    // set error untuk text field
    @IBAction func createGoalButtonPressed(_ sender: Any) {
        
        // check if book title & total pages is empty
        if bookTitleTextField.text?.isEmpty == true && totalPagesTextField.text?.isEmpty == true {
            showToast(message: "All field must be filled")
            return
        }
        
        // check if bookTitle is empty
        if bookTitleTextField.text?.isEmpty == true {
            showToast(message: "Book title must be filled")
            return
        }
        
        let totalPages = totalPagesTextField.text ?? ""
        
        // check if total pages is empty
        if totalPagesTextField.text?.isEmpty == true {
            showToast(message: "Total pages must be filled")
            return
        }
        
        // check if total pages is numeric
        if Int(totalPages) == nil {
            showToast(message: "Total pages must be numeric")
            return
        }
        
        // check if total pages is greater than 0
        if Int(totalPages) ?? 0 <= 0 {
            showToast(message: "Total pages must be greater than 0")
            return
        }
        
        let timeTarget = readingTimeTargetPicker.countDownDuration
        
        // check if time target is more than or equals to 15 minutes
        if timeTarget < 900 {
            showToast(message: "Time target must be more than 15 minutes")
            return
        }
        
        // add all data to user default
        let goal = Goal(bookTitle: bookTitleTextField.text ?? "", totalPages: totalPages, timeTarget: timeTarget)
        UserDefaults.standard.userGoal = goal
        
        UserDefaults.standard.setOnboardingSeen()
        navigationManager.show(screen: .goHome, inController: self)
        print("Create goal success")
    }

    override func viewWillAppear(_ animated: Bool) {
        bookTitleTextField.borderStyle = UITextField.BorderStyle.roundedRect
        totalPagesTextField.borderStyle = UITextField.BorderStyle.roundedRect
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

//MARK: - UITextFieldDelegate
extension UIViewController {
func dismissKeyboard() {
       let tap: UITapGestureRecognizer = UITapGestureRecognizer( target:     self, action:    #selector(UIViewController.dismissKeyboardTouchOutside))
       tap.cancelsTouchesInView = false
       view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboardTouchOutside() {
       view.endEditing(true)
    }
}
