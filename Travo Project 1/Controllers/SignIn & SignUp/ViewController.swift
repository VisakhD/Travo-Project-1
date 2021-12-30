//
//  ViewController.swift
//  Travo Project 1
//
//  Created by Visakh D on 09/12/21.
//

import UIKit

class ViewController: UIViewController {
    weak var rootDelgate : RootSwitching?
    override func viewDidLoad() {
        super.viewDidLoad()
       rootDelgate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
    }

    @IBAction func signInButton(_ sender: Any) {
//        let homeVC = self.storyboard?.instantiateViewController(identifier: "SignInVC") as! SignInVC
//        self.navigationController?.pushViewController( homeVC, animated: true)
        rootDelgate?.loginSucceed()
    }
    
    @IBAction func signUpButton(_ sender: Any) {
       
        let homeVC = self.storyboard?.instantiateViewController(identifier: "SignUpOtpVC") as! SignUpOtpVC
        self.navigationController?.pushViewController( homeVC, animated: true)
    }
}

