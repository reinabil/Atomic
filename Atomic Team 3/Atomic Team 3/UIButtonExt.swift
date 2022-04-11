//
//  UIButtonExt.swift
//  Atomic Team 3
//
//  Created by Hafizh Mo on 12/04/22.
//

import Foundation
import UIKit

extension UIButton {
    
    func passed() {
        setTitle("", for: .normal)
        setImage(UIImage(systemName: "checkmark"), for: .normal)
        tintColor = UIColor(named: "main_orange")
        backgroundColor = UIColor(named: "secondary_orange")
        layer.cornerRadius = 4
    }
    
    func current(count: Int) {
        tintColor = UIColor.white
        backgroundColor = UIColor(named: "main_orange")
        layer.cornerRadius = 4
        
        setImage(nil, for: .normal)
        setTitle("\(count+1)", for: .normal)
    }
}
