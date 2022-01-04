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
    var postSigInData : String?
    let confirmNavsucess = "saved successfully and otp had sent"
    let confirmNavFailed = "Number already exists"
    weak var rootDelgate : RootSwitching?
    @IBOutlet weak var userButton: UIButton!
    @IBOutlet weak var propertyButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneNumbTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RegisterService.sharedInstance.delegateSigIn = self
        rootDelgate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
        emailTextField.customField()
        passwordTextField.customField()
        phoneNumbTextField.customField()
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
                //                RegisterService.sharedInstance.callingApiPost(register: RegisterModel.init(sign_up_by: strValue, mobileNumber: phoneNumber))
            }
            else if strValue == "property"{
                print("Property")
                //                RegisterService.sharedInstance.callingApiPost(register: RegisterModel.init(sign_up_by: strValue, mobileNumber: phoneNumber))
            }
            else if strValue == ""{
                alertMessages(title: "Error", message: "Choose USER or PROPERTY OWNER")
            }
        }else {
            alertMessages(title:  "Error", message: "Please Enter 10 Digits Phone Number")
        }
        
    }
    //    MARK:- SIGNIN FUNCTOINS AND API CALLING PROCEDURE & VALIDATION
    
    @IBAction func signInButton(_ sender: UIButton) {
        let signInEmail = emailTextField.text
        let signInPassword = passwordTextField.text
        
        if signInEmail != nil && signInPassword != nil {
            
            let data = SignInInfo.init(email: signInEmail, password: signInPassword)
            RegisterService.sharedInstance.postSignIn(data: data)
            
        }else {
            print("The sign up id done properly")
        }
        
    }
    
    
    func sigin() {
        if  postSigInData == "sucess" {
            rootDelgate?.loginSucceed()
        }else {
            return
        }
    }
    
    @IBAction func forgotPasswordButton(_ sender: Any) {
        
    }
    @IBAction func signUpButton(_ sender: Any) {
        let signUpVC = self.storyboard?.instantiateViewController(identifier: "SignUpOtpVC") as! SignUpOtpVC
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    
    
    
    // MARK:- NAVIGATE TO NEXT VIEW CONTROLLER
    
    func navAuth(){
        if postMessage == confirmNavsucess{
            let regVC = storyboard?.instantiateViewController(identifier: "register2")  as! OTPRegisterSignInViewController
            self.navigationController?.pushViewController(regVC, animated: true)
            
        }else if postMessage == confirmNavFailed{
            alertMessages(title: "Error", message: "Number already exists")
        }else{
            return
        }
    }
    
    func alertMessages(title : String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .destructive, handler: { _ in
            print("password and confirm password doesnot match")
        }))
        present(alert, animated: true, completion: nil)
    }
    
}

extension SignInVC : PostRespondsSignIN {
    func data(result: String?, token: String?) {
        postSigInData = result!
        sigin()
    }
    
}

