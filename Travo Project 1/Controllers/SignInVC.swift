//
//  SignUpViewController.swift
//  Travo Project 1
//
//  Created by Visakh D on 11/12/21.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet weak var userButton: UIButton!
    @IBOutlet weak var propertyButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneNumbTextField: UITextField!
    
    var selected : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       customTextField()
        // Do any additional setup after loading the view.
    }
  
//MARK:-  RADIO BUTTON IN SIGNIN PAGE
    
//    radio button function for these button implemented
    @IBAction func userRadioButton(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            propertyButton.isSelected = false
            selected = "nil"
        } else {
            sender.isSelected = true
            propertyButton.isSelected = false
            selected = "user"
        }
        
    }
    @IBAction func propertyRadioButton(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            userButton.isSelected = false
            selected = "nil"
        }else {
            sender.isSelected = true
            userButton.isSelected = false
            selected = "property"
        }
    }
    
    @IBAction func signInButton(_ sender: Any) {
        
    }
    @IBAction func otpCodeButton(_ sender: Any) {
        if selected == "user"{
            print("User")
        }
        else if selected == "property"{
            print("Property")
        }
        else if selected == "nil"{
            print("error")
        }
        let num : String =  phoneNumbTextField.text ?? ""
        RegisterService.sharedInstance.callingApiPost(register: RegisterModel.init(sign_up_by: selected, mobileNumber: num))
        
    }
    @IBAction func forgotPasswordButton(_ sender: Any) {
        
    }
    @IBAction func signUpButton(_ sender: Any) {
    }
    
    
    
//MARK:- CUSTOM TEXT FIELD
    
   
    func customTextField() {
        
        let caObj = CALayer()
        
//        let phoneLine  = caObj
//        let emailLine  = caObj
//        let passwordLine = caObj
        caObj.frame = CGRect(x: 0, y: phoneNumbTextField.frame.height, width: phoneNumbTextField.frame.width, height: 2)
        caObj.backgroundColor = UIColor.black.cgColor
        caObj.frame = CGRect(x: 0, y: emailTextField.frame.height, width: 278, height: 2)
        caObj.backgroundColor = UIColor.black.cgColor
        caObj.frame = CGRect(x: 0, y: passwordTextField.frame.height, width: 278, height: 2)
        caObj.backgroundColor = UIColor.black.cgColor
//        Remove textField border
        
        phoneNumbTextField.borderStyle = .none
        emailTextField.borderStyle = .none
        passwordTextField.borderStyle = .none
        
//        add line to the text field
        
        phoneNumbTextField.layer.addSublayer(caObj)
        emailTextField.layer.addSublayer(caObj)
        passwordTextField.layer.addSublayer(caObj)
    }
    
    
}
