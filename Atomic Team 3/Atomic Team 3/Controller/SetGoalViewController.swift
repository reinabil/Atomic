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
    
    let userDefault = UserDefaults.standard
    var bookTitle:String = ""
    var totalPages:Int = 0
    var readingTimeTarget = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        bookTitle = bookTitleTextField.text
//        totalPages = Int(totalPagesTextField.text)
        
        if validateBookTitle() && validateTotalPages() {
            
        }
        
        userDefault.set(bookTitle, forKey: "bookTitle")
        userDefault.set(totalPages, forKey: "totalPages")
    }
    
    func validateBookTitle() -> Bool {
        if bookTitle.isEmpty {
            return false
        }
        
        return true
    }
    
    func validateTotalPages() -> Bool {
//        if totalPages is Int || totalPages <= 0{
//            return false
//        }
        
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        bookTitleTextField.borderStyle = UITextField.BorderStyle.roundedRect
        totalPagesTextField.borderStyle = UITextField.BorderStyle.roundedRect
    }
}
