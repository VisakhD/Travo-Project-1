//
//  RegisterService.swift
//  Travo Project 1
//
//  Created by Visakh D on 13/12/21.
//

import Foundation
import Alamofire

protocol PostResponse {
    func message(message:String?,id:String?)
//    func id(id:String?)
}

class RegisterService {
    var delegate : PostResponse?
    
    
    static let sharedInstance = RegisterService()
    
    func callingApiPost(register : RegisterModel) {
        
        AF.request("https://travosocialmedia.herokuapp.com/api/auth/signup", method: .post, parameters: register , encoder: JSONParameterEncoder.default).responseJSON { (responds) in
            switch responds.result {
            case .success(let message) :
                if let JSON = message as? [String: Any] {
                    let message = JSON["message"] as! String
                    let id = JSON["_id"] as! String
                    self.delegate?.message(message: message, id: id)
//                    self.delegate?.id(id: id)
                    print(message)
                    print(id)
                }
            case .failure(let Error): return
                print(Error)
            }
        }
    }
    func postApiDetails(registerDetails : RegisterDetailsModel ){
        
        AF.request("https://travosocialmedia.herokuapp.com/api/auth/mobile_signup", method: .post, parameters: registerDetails, encoder: JSONParameterEncoder.default).responseJSON { (respondsDetails) in
            switch respondsDetails.result {
            case .success(let message) :
                if let JSON = message as? [String: Any] {
                    let token = JSON["token"] as! String
                    print(token)
                }
            case .failure(let error): return
                print(error)
            }
        }
    }
}


