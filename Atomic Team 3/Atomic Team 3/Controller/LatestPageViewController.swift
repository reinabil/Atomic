//
//  LatestPageViewController.swift
//  Atomic Team 3
//
//  Created by Hafizh Mo on 06/04/22.
//

import Foundation
import UIKit

class LatestPageViewController: UIViewController {
    @IBOutlet weak var whiteCard: UIView!
    @IBOutlet weak var latestPage: UITextField!
    private var navigationManager = NavigationManager()
    
    override func viewDidLoad() {
        whiteCard.layer.cornerRadius = 10
    }
    @IBAction func updateMyProgressPressed(_ sender: UIButton) {
        UserDefaults.standard.latestPage = Float(latestPage.text ?? "0")
        print(UserDefaults.standard.latestPage)
        navigationManager.show(screen: .goHome, inController: self)
        
    }
    @IBAction func finishReadingGoalPressed(_ sender: UIButton) {
        navigationManager.show(screen: .goHome, inController: self)
    }
}
