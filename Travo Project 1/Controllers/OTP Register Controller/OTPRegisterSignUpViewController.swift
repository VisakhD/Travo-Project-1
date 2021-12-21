//
//  OTPRegisterSignUpViewController.swift
//  Travo Project 1
//
//  Created by Visakh D on 16/12/21.
//

import UIKit

class OTPRegisterSignUpViewController: UIViewController {
    var sigUpIdData : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sentAgainButton(_ sender: UIButton) {
        
    }
    
    @IBAction func submitButton(_ sender: UIButton) {
        let signUpVC = storyboard?.instantiateViewController(identifier: "register3") as! SignUpDetailsViewController
        self.navigationController?.pushViewController(signUpVC, animated: true)
        signUpVC.signUpId = sigUpIdData
    }
    

}
