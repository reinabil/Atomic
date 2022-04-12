//
//  LoadingViewController.swift
//  Atomic Team 3
//
//  Created by Nabil Rei on 11/04/22.
//
import Foundation
import UIKit

class LoadingViewController: UIViewController {
    private var isOnboardingSeen: Bool!
    
    private let navigationManager = NavigationManager()
    override func viewDidLoad() {
        isOnboardingSeen = UserDefaults.standard.onboardingSeen()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if UserDefaults.standard.userGoal != nil {
            showInitialScreen()
        } else {
            navigationManager.show(screen: .firstTime, inController: self)
        }
    }
    
    func showInitialScreen() {
        if isOnboardingSeen {
            // go to home page
            navigationManager.show(screen: .mainApp, inController: self)
        } else {
            // go to onboarding
            navigationManager.show(screen: .firstTime, inController: self)
        }
    }
}
