//
//  SignUpViewController.swift
//  Travo Project 1
//
//  Created by Visakh D on 11/12/21.
//

import UIKit

class SignInVC: UIViewController {
    var strValue : String = ""
    var phoneNumber : String = ""
    var postMessage :String?
    let confirmNavsucess = "saved successfully and otp had sent"
    let confirmNavFailed = "Number already exists"
    @IBOutlet weak var userButton: UIButton!
    @IBOutlet weak var propertyButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneNumbTextField: UITextField!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
       customTextField()
        RegisterService.sharedInstance.delegate = self
        // Do any additional setup after loading the view.
    }
    
//MARK:- MOBILE NUMBER VALIDATION
    
    func validation () -> Bool? {
        phoneNumber  = phoneNumbTextField.text!
        let count = phoneNumber.count
        if count == 10 {
            print("validation sucess")
            return true
        }else{
            print(" validation error")
            return false
        }
    }
//MARK:-  RADIO BUTTON IN SIGNIN PAGE
    
//    radio button function for these button implemented
    
    func setUser (isUser : Bool){
        if isUser{
            strValue = "user"
            userButton.setImage(UIImage(named: "radio_checked"), for: .normal)
            propertyButton.setImage(UIImage(named: "radio_unchecked"), for: .normal)
        }else {
            strValue = "propertyowner"
            propertyButton.setImage(UIImage(named: "radio_checked"), for: .normal)
            userButton.setImage(UIImage(named: "radio_unchecked"), for: .normal)
        }
    }
    @IBAction func userRadioButton(_ sender: UIButton) {
        setUser(isUser: true)
    }
    @IBAction func propertyRadioButton(_ sender: UIButton) {

        setUser(isUser: false)
    }
//MARK:- OTP SENDING API FUNCTION
    
    @IBAction func otpCodeButton(_ sender: Any) {
        let phoneNumb = validation()
        if phoneNumb == true {
            if strValue == "user"{
                print("User")
                RegisterService.sharedInstance.callingApiPost(register: RegisterModel.init(sign_up_by: strValue, mobileNumber: phoneNumber))
            }
            else if strValue == "property"{
                print("Property")
                RegisterService.sharedInstance.callingApiPost(register: RegisterModel.init(sign_up_by: strValue, mobileNumber: phoneNumber))
            }
            else if strValue == ""{
                showAlertError()
            }
        }else {
            alertErrorPhoneNumber()
        }
        
    }
    @IBAction func signInButton(_ sender: Any) {
        
    }
    @IBAction func forgotPasswordButton(_ sender: Any) {
        
    }
    @IBAction func signUpButton(_ sender: Any) {
        let signUpVC = self.storyboard?.instantiateViewController(identifier: "SignUpOtpVC") as! SignUpOtpVC
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
// MARK:- ALERT FUNCTION FOR ERRORS
    
    func showAlertError(){
        let  alert = UIAlertController(title: "Error", message: "Choose USER or PROPERTY OWNER", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .destructive, handler: { action in
            print("user or property owner is not selected")
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func alertErrorPhoneNumber() {
        let alert = UIAlertController(title: "Error", message: "Please Enter 10 Digits Phone Number", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .destructive, handler: { _ in
            print("user or property owner is not selected")
        }))
        present(alert, animated: true, completion: nil)
    }
    
    
//MARK:- CUSTOM TEXT FIELD
    
   
    func customTextField() {
        
        let phoneLine  = CALayer()
        let emailLine  = CALayer()
        let passwordLine = CALayer()
        phoneLine.frame = CGRect(x: 0, y: phoneNumbTextField.frame.height, width: phoneNumbTextField.frame.width, height: 2)
        phoneLine.backgroundColor = UIColor.black.cgColor
        emailLine.frame = CGRect(x: 0, y: emailTextField.frame.height, width: 278, height: 2)
        emailLine.backgroundColor = UIColor.black.cgColor
        passwordLine.frame = CGRect(x: 0, y: passwordTextField.frame.height, width: 278, height: 2)
        passwordLine.backgroundColor = UIColor.black.cgColor
//        Remove textField border
        
        phoneNumbTextField.borderStyle = .none
        emailTextField.borderStyle = .none
        passwordTextField.borderStyle = .none
        
//        add line to the text field
        
        phoneNumbTextField.layer.addSublayer(phoneLine)
        emailTextField.layer.addSublayer(emailLine)
        passwordTextField.layer.addSublayer(passwordLine)
    }
    
// MARK:- NAVIGATE TO NEXT VIEW CONTROLLER
    
    func navAuth(){
        if postMessage == confirmNavsucess{
            let regVC = storyboard?.instantiateViewController(identifier: "register2")  as! OTPRegisterSignInViewController
            self.navigationController?.pushViewController(regVC, animated: true)
            
        }else if postMessage == confirmNavFailed{
            alertErrorNumberExist()
        }else{
            return
        }
        
        
        func alertErrorNumberExist() {
            let alert = UIAlertController(title: "Error", message: "Number already exists", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .destructive, handler: { _ in
                print("user or property owner is not selected")
            }))
            present(alert, animated: true, completion: nil)
        }
    }
    
}
extension SignInVC : PostResponse {
    func message(message: String?, id: String?) {
        postMessage = message!
        navAuth()
    }
}
