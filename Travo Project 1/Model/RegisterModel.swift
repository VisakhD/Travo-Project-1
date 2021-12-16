//
//  RegisterModel.swift
//  Travo Project 1
//
//  Created by Visakh D on 13/12/21.
//

import Foundation

struct RegisterModel: Encodable {
    
    let sign_up_by : String?
    let mobileNumber : String?

}

struct RespondsModel : Decodable {
    let message : String?
    let _id : String?
    
}





