//
//  HomeViewController1.swift
//  Atomic Team 3
//
//  Created by Nabil Rei on 11/04/22.
//

import Foundation
import UIKit

class SettedHomeViewController: UIViewController{
    @IBOutlet weak var streakCard: UIView!
    @IBOutlet weak var goalEmptyCard: UIView!
    
    override func viewDidLoad() {
        streakCard.layer.cornerRadius = 10
        goalEmptyCard.layer.cornerRadius = 10
    }
}
