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
    let user : User?
    
}
struct User : Decodable {
    let mobileNumber : String?
    let following : [String]?
    let followers : [String]?
    let _id : String?
    let createdAt : String?
    let updatedAt : String?
    let __v : Int?
}



