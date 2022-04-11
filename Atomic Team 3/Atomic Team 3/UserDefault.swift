//
//  StoregaManager.swift
//  Atomic Team 3
//
//  Created by Nabil Rei on 11/04/22.
//

import Foundation

extension UserDefaults {
    
    enum Key: String {
        case onboardingSeen
        case userGoal
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
    
    var userGoal: Goal? {
        get {
            if let data = object(forKey: Key.userGoal.rawValue) as? Data {
                let member = try? JSONDecoder().decode(Goal.self, from: data)
                return member
            }
            return nil
        }

        set {
            if newValue == nil {
                removeObject(forKey: Key.userGoal.rawValue)
            } else {
                let data = try? JSONEncoder().encode(newValue)
                setValue(data, forKey: Key.userGoal.rawValue)
            }
        }
    }
}
