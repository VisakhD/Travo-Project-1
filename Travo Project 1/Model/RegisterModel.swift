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
    let mobileNumber : String?
    
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
//changed the User name into userdet if error shots check this area
struct User : Codable {
    let mobileNumber : String?
    let following : [String]?
    let followers : [String]?
    let email : String?
    let user_name : String?
    let name : String?
    
}

//MARK:- SIGN IN MODEL FOR SENTING SIGNIN DETAILS

struct SignInInfo : Codable {
    let email : String?
    let password : String?

}

struct SignInResponds : Codable {
    let token : String?
    let user : UserDt?
}

struct UserDt : Codable {
    let mobileNumber : String?
    let following : [String]?
    let followers : [String]?
    let email : String?
    let user_name : String?
    let name : String?
    let _id : String?
}

//MARK:- OTP POST METHODS AND RESPONDS

struct OtpSignUp : Codable {
    let mobileNumber : String?
    let otp : String?

}

struct OtpSignUpResponds : Codable {
    let message : String?
    let _id : String?
}
