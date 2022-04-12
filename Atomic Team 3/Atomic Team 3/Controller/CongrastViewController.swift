//
//  CongrastViewController.swift
//  Atomic Team 3
//
//  Created by Hafizh Mo on 12/04/22.
//

import Foundation
import UIKit

class CongrastViewController: UIViewController {
    @IBOutlet weak var cardView: UIView!
    private var navigationManager = NavigationManager()
    
    override func viewDidLoad() {
        cardView.layer.cornerRadius = 10
    }
    
    @IBAction func btnBackHomeClicked(_ sender: UIButton) {
        self.navigationManager.show(screen: .firstTime, inController: self)
    }
    
    @IBAction func btnSetNewGoalClicked(_ sender: UIButton) {
        self.navigationManager.show(screen: .setGoal, inController: self)
    }
    
}
