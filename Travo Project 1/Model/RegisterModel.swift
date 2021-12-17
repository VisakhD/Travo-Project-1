//
//  RegisterModel.swift
//  Travo Project 1
//
//  Created by Visakh D on 13/12/21.
//

import Foundation

//MARK:- OTP MODEL FOR THE APP POST & GET REQUEST

struct RegisterModel: Encodable {
    
    let sign_up_by : String?
    let mobileNumber : String?

}

struct RespondsModel : Decodable {
    let message : String?
    let _id : String?
    
}
//MARK:- REGISTER DETAILS MODEL FOR THE APP POST AND GET REQUEST

struct RegisterDetailsModel : Codable {
    let name : String?
    let user_name : String?
    let userId : String?
    let email : String?
    let password : String?

}

struct RegisterDetailsResponds : Codable {
    let token : String?
    let user : User?
}

struct User : Codable {
    let mobileNumber : String?
    let following : [String]?
    let followers : [String]?
    let email : String?
    let user_name : String?
    let name : String?
}
