//
//  UnsettedHomeViewController.swift
//  Atomic Team 3
//
//  Created by Hafizh Mo on 06/04/22.
//

import Foundation
import UIKit

class UnsettedHomeViewController: UIViewController{
    @IBOutlet weak var streakCard: UIView!
    @IBOutlet weak var goalEmptyCard: UIView!
    
    override func viewDidLoad() {
        streakCard.layer.cornerRadius = 10
        goalEmptyCard.layer.cornerRadius = 10
    }
}
