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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        bookTitleTextField.borderStyle = UITextField.BorderStyle.roundedRect
        totalPageTextField.borderStyle = UITextField.BorderStyle.roundedRect
    }
}
