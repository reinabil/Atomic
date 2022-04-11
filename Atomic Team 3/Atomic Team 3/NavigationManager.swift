//
//  NavigationManager.swift
//  Atomic Team 3
//
//  Created by Nabil Rei on 11/04/22.
//

import Foundation
import UIKit

class Navigationmanager {
    enum Screen {
        case onboarding
        case mainApp
    }
    
    func show(screen: Screen, inController: UIViewController) {
        
        var viewController: UIViewController!
        
        switch screen {
        case .onboarding:
            viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "OnboardViewController")
        case .mainApp:
            viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "UnsettedHomeViewController")
        }
        
        if let sceneDelegate = inController.view.window?.windowScene?.delegate as? SceneDelegate, let
            window = sceneDelegate.window {
            window.rootViewController = viewController
        }
    }
}
