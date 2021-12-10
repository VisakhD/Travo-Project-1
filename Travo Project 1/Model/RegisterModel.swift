//
//  RegisterModel.swift
//  Travo Project 1
//
//  Created by Visakh D on 09/12/21.
//

import Foundation
import UIKit


struct RegisterModel : Codable {
    let sign_up_by : String?
    let mobileNumber : String?
    
    init(sign_up_by : String , mobileNumber : String) {
        self.sign_up_by = sign_up_by
        self.mobileNumber = mobileNumber
    } 
}


