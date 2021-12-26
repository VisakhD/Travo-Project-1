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
    func ID(id : String?, token : String?, message : String?)
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
    
    static let sharedInstance = RegisterService()
    
//    MARK:- SIGNUP MOBILE NUMBER REGISTERATION
    
    func callingApiPost(register : RegisterModel) {
        
        AF.request("https://travosocialmedia.herokuapp.com/api/auth/signup", method: .post, parameters: register , encoder: JSONParameterEncoder.default).responseJSON { (responds) in
            switch responds.result {
            case .success(let message) :
                if let JSON = message as? [String: Any] {
                    let message = JSON["message"] as! String
//                    let sigUpID = JSON["_id"] as! String
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
            case .success(let message) :
                if let JSON = message as? [String: Any] {
                    let message = JSON["message"] as! String
                    let token = JSON["token"] as! String
                    let id = JSON["_id"] as! String
                    let mobileNumber = JSON["mobileNumber"] as! String
                    
                    self.delegateID?.ID(id: id, token: token,message : message)
                    print(token)
                    print(id)
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


