//
//  TextField.swift
//  Atomic Team 3
//
//  Created by Minawati on 06/04/22.
//

import UIKit

class TextField: UITextField {

    var padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
