//
//  OnboardController.swift
//  Atomic Team 3
//
//  Created by Nabil Rei on 05/04/22.
//

import Foundation
import UIKit

struct OnboardBrain {
    var contents = [
        Onboard(image: UIImage(named: "onboard_1"), title: "Set Your New Reading Goals Easily!", subtitle: "There were only simple steps for you to set your reading goals! No hassle!", button1: "Next", button2: "Skip"),
        Onboard(image: UIImage(named: "onboard_2"), title: "Maintain Your Daily Reading Habit!", subtitle: "Keep tracking your reading progress and consistently gaining new insights everyday!", button1: "Next", button2: "Skip"),
        Onboard(image: UIImage(named: "onboard_3"), title: "Experience a New Way to Read Books", subtitle: "With Readify, you’ll experience a brand new way to enjoy your books!", button1: "Get started", button2: "none")
    ]
    
    
}
