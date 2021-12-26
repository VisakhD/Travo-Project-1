//
//  ViewController.swift
//  Travo Project 1
//
//  Created by Visakh D on 09/12/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func signInButton(_ sender: Any) {
        let homeVC = self.storyboard?.instantiateViewController(identifier: "SignInVC") as! SignInVC
        self.navigationController?.pushViewController( homeVC, animated: true)
        
    }
    
    @IBAction func signUpButton(_ sender: Any) {
       
        let homeVC = self.storyboard?.instantiateViewController(identifier: "SignUpOtpVC") as! SignUpOtpVC
        self.navigationController?.pushViewController( homeVC, animated: true)
    }
}

