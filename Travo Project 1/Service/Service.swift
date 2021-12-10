//
//  Service.swift
//  Travo Project 1
//
//  Created by Visakh D on 09/12/21.
//

import UIKit

class Service: NSObject {
    
    static let shared = Service()

    func apiPost() {
        guard let url = URL(string: "https://travosocialmedia.herokuapp.com/api/auth/signup")
        else { return }
        
        var request = URLRequest(url: url)
//        method / datas /
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String : AnyHashable] = [
            "sign_up_by" : "user",
            "mobileNumber" : "9447996475"
            
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
//        make the request
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data =  data, error == nil else { return }
        
        do {
            let response = try JSONSerialization.jsonObject(with: data
                                                            , options: .allowFragments)
            print("SUCCESS:\(response)")
        }catch {
            print (error)
        }
            
        }
        task.resume()
    }
}
