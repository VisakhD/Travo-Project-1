//
//  SignUpDetailViewController.swift
//  Travo Project 1
//
//  Created by Visakh D on 17/12/21.
//

import UIKit


class SignUpDetailsViewController: UIViewController {
    var signUpId : String = ""
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customTextFlied()
        
        // Do any additional setup after loading the view.
    }
    
// MARK:- VALIDATION FOR THE TEXT FIELD IN SIGNUP PAGE
    
    @IBAction func submitNavButton(_ sender: Any) {
        let name = nameTextField.text!
        let username = usernameTextField.text!
        let email = emailTextField.text!
        let password = passwordTextField.text!
        let confirmPassword = confirmPasswordTextField.text!
        let id = signUpId
        
     let reg =   RegisterDetailsModel.init(name: name, user_name: username, userId: id, email: email, password: password)
        
        RegisterService.sharedInstance.postApiDetails(registerDetails: reg)
    }
    
//MARK:- CUSTOM TEXT FIELD CODE
    
    func customTextFlied(){
        
    let nameFieldLine = CALayer()
        nameFieldLine.frame = CGRect(x: 0, y: nameTextField.frame.height, width: 280, height: 2)
        nameFieldLine.backgroundColor = UIColor.black.cgColor
//        removing border for textfield
        nameTextField.borderStyle = .none
//        addLine to the textfield
        nameTextField.layer.addSublayer(nameFieldLine)
        
        let usernameFieldLine = CALayer()
            usernameFieldLine.frame = CGRect(x: 0, y: usernameTextField.frame.height, width: 280, height: 2)
            usernameFieldLine.backgroundColor = UIColor.black.cgColor
    //        removing border for textfield
            usernameTextField.borderStyle = .none
    //        addLine to the textfield
            usernameTextField.layer.addSublayer(usernameFieldLine)
    
        let emailFieldLine = CALayer()
            emailFieldLine.frame = CGRect(x: 0, y: emailTextField.frame.height, width: 280, height: 2)
            emailFieldLine.backgroundColor = UIColor.black.cgColor
    //        removing border for textfield
            emailTextField.borderStyle = .none
    //        addLine to the textfield
            emailTextField.layer.addSublayer(emailFieldLine)
        
        let passwordFieldLine = CALayer()
            passwordFieldLine.frame = CGRect(x: 0, y: passwordTextField.frame.height, width: 280, height: 2)
            passwordFieldLine.backgroundColor = UIColor.black.cgColor
    //        removing border for textfield
            passwordTextField.borderStyle = .none
    //        addLine to the textfield
            passwordTextField.layer.addSublayer(passwordFieldLine)
        
        let confirmPasswordFieldLine = CALayer()
            confirmPasswordFieldLine.frame = CGRect(x: 0, y: confirmPasswordTextField.frame.height, width: 280, height: 2)
            confirmPasswordFieldLine.backgroundColor = UIColor.black.cgColor
    //        removing border for textfield
            confirmPasswordTextField.borderStyle = .none
    //        addLine to the textfield
            confirmPasswordTextField.layer.addSublayer(confirmPasswordFieldLine)
    }
    
    
    
}

