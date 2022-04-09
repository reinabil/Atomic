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
    @IBOutlet weak var totalPageTextField: UITextField!
    @IBOutlet weak var readingTimeTargetPicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        bookTitleTextField.borderStyle = UITextField.BorderStyle.roundedRect
        totalPageTextField.borderStyle = UITextField.BorderStyle.roundedRect
    }
    
    
    @IBAction func updateButtonPressed(_ sender: Any) {
//        print(readingTimeTargetPicker.countDownDuration)
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
         
        // init alert dialog for delete confirmation
        let alertDialog = UIAlertController(title: "Delete goal?", message: "Once you delete, you'll lose all your progress so far", preferredStyle: .alert)
        
        // Back button action handler
        let backButton = UIAlertAction(title: "Back", style: .cancel, handler: nil)
        
        // Yes, delete button action handler
        let confirmDeleteButton = UIAlertAction(title: "Yes, delete", style: .destructive, handler: {
            action in
            // delete goal func
        })
        
        alertDialog.addAction(backButton)
        alertDialog.addAction(confirmDeleteButton)
        
        // present alert dialog
        self.present(alertDialog, animated: true, completion: nil)
    }
}
