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

class RegisterService {
    var delegate : PostResponse?
    
    
    static let sharedInstance = RegisterService()
    
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
    
}

class RegisterDetailsService {
    
}

