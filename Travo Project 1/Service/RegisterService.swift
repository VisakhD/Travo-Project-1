//
//  RegisterService.swift
//  Travo Project 1
//
//  Created by Visakh D on 13/12/21.
//

import Foundation
import Alamofire

protocol PostResponse {
    func message(message:String?)
    
}
protocol PostRespondsSignIN {
    func data (result : String?,token : String?)
}

protocol PostRespondsSignInDetails {
    func ID(token : String?)
}

protocol PostOtpSignUpResponds {
    func message(message : String?, id: String?)
}

class RegisterService {
    var delegate : PostResponse?
    var delegateSigIn : PostRespondsSignIN?
    var delegateID : PostRespondsSignInDetails?
    var delegateOtp : PostOtpSignUpResponds?
    var notice : String = ""
    
    var namePass : String = ""
    var usernamePass : String = ""
    var emailPass : String = ""
    var followingPass : Int?
    var followersPass : Int?
    var tokenPass : String = ""
    var mobileNumberpass : String = ""
    
    static let sharedInstance = RegisterService()
    
//    MARK:- SIGNUP MOBILE NUMBER REGISTERATION
    
    func callingApiPost(register : RegisterModel) {
        
        AF.request("https://travosocialmedia.herokuapp.com/api/auth/signup", method: .post, parameters: register , encoder: JSONParameterEncoder.default).responseJSON { (responds) in
            switch responds.result {
            case .success(let message) :
                if let JSON = message as? [String: Any] {
                    
                    let message = JSON["message"] as! String

                    self.delegate?.message(message: message)
                    print(message)
                   
                }
            case .failure(let Error): return
                print(Error)
            }
        }
    }
  
//    MARK:- SIGNUP DETAILS PAGE POST & RESPONDS  REGISTERATION
    
    func postApiDetails(registerDetails : RegisterDetailsModel ){
        
        AF.request("https://travosocialmedia.herokuapp.com/api/auth/mobile_signup", method: .post, parameters: registerDetails, encoder: JSONParameterEncoder.default).responseJSON { (respondsDetails) in
            switch respondsDetails.result {
//            case .success(let message) :
//                if let JSON = message as? [String: Any] {
//
//                    let token = JSON["token"] as! String
////                    let email = JSON["email"] as! String
////                    print(email)
//                    self.delegateID?.ID(token: token)
//                    print(token)
//
//
//                }
            case.success(let data) :
                if let JSON = data as? [String : Any] {
                    let token = JSON["token"] as? String
                    print(token!)
                    self.tokenPass = token!
                    self.delegateID?.ID(token: token)
                    if let  user =  JSON ["user"] as? [String:AnyObject] {
                        if let email = user ["email"] as? String {
                            print(email)
                            self.emailPass = email
                        }
                        if let mobileNumber = user ["mobileNumber"] as? String {
                            print(mobileNumber)
                            self.mobileNumberpass = mobileNumber
                        }
                        if let following = user["following"]?.count {
                            print(following)
                            self.followingPass = following
                        }
                        if let followers = user["followers"]?.count {
                            print(followers)
                            self.followersPass = followers
                        }
                        if let username = user["user_name"] as? String {
                            print(username)
                            self.usernamePass = username
                        }
                        if let name = user["name"] as? String {
                            print(name)
                            self.namePass = name
                        }
                     }
                    CoreData.shared.signUpUserDetails(name: self.namePass, username: self.usernamePass, following: self.followingPass!, followers: self.followersPass!, mobileNumber: self.mobileNumberpass, email: self.mobileNumberpass, token: self.tokenPass)
                }
            case .failure(let error): return
                print(error)
            }
        }
    }
    
//    MARK:- SIGNIN PAGE POST AND RESPONDS
    
    func postSignIn(data : SignInInfo ) {
        AF.request("https://travosocialmedia.herokuapp.com/api/auth/signin", method: .post, parameters: data, encoder: JSONParameterEncoder.default).responseJSON { (respondsData) in
            switch respondsData.result {
            case.success(let message) :
                if let JSON = message as? [String : Any] {
                    let  token = JSON["token"] as! String
                    print("sigIn Sucess:\(token)")
                    self.notice = "sucess"
                    self.delegateSigIn?.data(result: self.notice, token: token)
                }
            case.failure(let error): return
                print(error)
                
            }
        }
    }
    
//    MARK:- OTP PAGE POST AND RESPONSE
    
    func postOtpVerify(data : OtpSignUp ) {
        AF.request("https://travosocialmedia.herokuapp.com/api/auth/otp-verify", method: .post, parameters: data, encoder: JSONParameterEncoder.default).responseJSON { (respondsData) in
            switch respondsData.result {
            case.success(let message) :
                if let JSON = message as? [String : Any] {
                    let message = JSON["message"] as! String
                    let id = JSON["_id"] as! String
                    print("sigIn Sucess:\(message)")
                    self.delegateOtp?.message(message: message, id: id)
                }
            case.failure(let error): return
                print(error)
            }
        }
    }
    
    
}


