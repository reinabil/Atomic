//
//  NavigationManager.swift
//  Atomic Team 3
//
//  Created by Nabil Rei on 11/04/22.
//

import Foundation
import UIKit

class NavigationManager {
    enum Screen {
        case firstTime
        case mainApp
        case setGoal
        case goHome
        case finish
    }
    
    func show(screen: Screen, inController: UIViewController) {
        
        var viewController: UIViewController!
        
        switch screen {
        case .firstTime:
            viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "UnsettedHomeViewController")
            
        case .mainApp:
            viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SettedHomeViewController")
            
        case .setGoal:
            viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SetGoalViewController")
        
        case .goHome:
            viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SettedHomeViewController")
            
        case .finish:
            viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LatestPageViewController")
            
        }
        
        
        
        if let sceneDelegate = inController.view.window?.windowScene?.delegate as? SceneDelegate, let
            window = sceneDelegate.window {
            window.rootViewController = viewController
        }
    }
}
