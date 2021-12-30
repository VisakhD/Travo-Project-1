//
//  Helper.swift
//  Travo Project 1
//
//  Created by Visakh D on 18/12/21.
//

import Foundation
import UIKit

extension UITextField {
    
    func customField() {
        let usernameFieldLine = CALayer()
        
            usernameFieldLine.frame = CGRect(x: 0, y: self.frame.height, width: 280, height: 2)
            usernameFieldLine.backgroundColor = UIColor.black.cgColor
    //        removing border for textfield
            self.borderStyle = .none
    //        addLine to the textfield
           self.layer.addSublayer(usernameFieldLine)
    }
    
}
