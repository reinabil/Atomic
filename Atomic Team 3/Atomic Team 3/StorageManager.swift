//
//  StoregaManager.swift
//  Atomic Team 3
//
//  Created by Nabil Rei on 11/04/22.
//

import Foundation

class StorageManager {
    
    enum Key: String {
        case onboardingSeen
    }
    
    func onboardingSeen() -> Bool{
        UserDefaults.standard.bool(forKey: Key.onboardingSeen.rawValue)
    }
    
    func setOnboardingSeen() {
        UserDefaults.standard.set(true, forKey: Key.onboardingSeen.rawValue)
    }
    
    func resetOnboardingSeen() {
        UserDefaults.standard.set(false, forKey: Key.onboardingSeen.rawValue)
    }
}
