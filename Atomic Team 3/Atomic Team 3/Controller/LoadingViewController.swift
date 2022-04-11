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
    private var storageManager  = StorageManager()
    
    private let navigationManager = Navigationmanager()
    override func viewDidLoad() {
        isOnboardingSeen = storageManager.onboardingSeen()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showInitialScreen()
    }
    
    
    func showInitialScreen() {
        if isOnboardingSeen {
            // go to home page
            navigationManager.show(screen: .mainApp, inController: self)
        } else {
            // go to onboarding
            navigationManager.show(screen: .onboarding, inController: self)
        }
    }
}
