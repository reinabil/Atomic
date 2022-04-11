//
//  UserDefaultExtension.swift
//  Atomic Team 3
//
//  Created by Minawati on 11/04/22.
//

import Foundation

extension UserDefaults {
    private enum UserDefaultsKeys: String{
        case userGoal
    }

    var userGoal: Goal? {
        get {
            if let data = object(forKey: UserDefaultsKeys.userGoal.rawValue) as? Data {
                let member = try? JSONDecoder().decode(Goal.self, from: data)
                return member
            }
            return nil
        }

        set {
            if newValue == nil {
                removeObject(forKey: UserDefaultsKeys.userGoal.rawValue)
            } else {
                let data = try? JSONEncoder().encode(newValue)
                setValue(data, forKey: UserDefaultsKeys.userGoal.rawValue)
            }
        }
    }
}
