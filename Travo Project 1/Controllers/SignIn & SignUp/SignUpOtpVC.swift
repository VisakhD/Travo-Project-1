//
//  SignUpOtpVC.swift
//  Travo Project 1
//
//  Created by Visakh D on 14/12/21.
//

import UIKit


class SignUpOtpVC: UIViewController {
    var strVal : String = ""
    var phoneNumber : String = ""
    var postMessage :String?
    var signUpId : String = ""
    var passingNumber : String = ""
//    variables for Authentication purpose
    let confirmNavsucess = "saved successfully and otp had sent"
    let confirmNavFailed = "Number already exists"
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var userButton: UIButton!
    @IBOutlet weak var propertyOwner: UIButton!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customTextField()
        RegisterService.sharedInstance.delegate = self  // CALLING THE SIGN UP API RESPONDS "message for verification"
        
        // Do any additional setup after loading the view.
        

    }
    
    //MARK:- Radio Button
    
    func setUser(isUser:Bool) {
        if isUser{
            strVal = "user"
            userButton.setImage(UIImage(named:"radio_checked"), for: .normal)
            propertyOwner.setImage(UIImage(named: "radio_unchecked"), for: .normal)
        }
        else{
            strVal = "propertyOwner"
            propertyOwner.setImage(UIImage(named: "radio_checked"), for: .normal)
            userButton.setImage(UIImage(named: "radio_unchecked"), for: .normal)
        }
    }
    
    @IBAction func userRadioButton(_ sender: UIButton) {
        setUser(isUser: true)
    }
    
    @IBAction func propertyRadioButton(_ sender: UIButton) {
        setUser(isUser: false)
    }
    
    //MARK:- MOBILE NUMBER VALIDATION
    
    func validation () -> Bool? {
        phoneNumber  = phoneNumberTextField.text!
        let count = phoneNumber.count
        if count == 10 {
            print("validation sucess")
            return true
        }else{
            print(" validation error")
            return false
        }
    }
    
    
    @IBAction func sendCodeButton(_ sender: UIButton) {
        
        let phoneNumb = validation()
        if phoneNumb == true {
            if strVal == "user"{
                print("User")
                RegisterService.sharedInstance.callingApiPost(register: RegisterModel(sign_up_by: strVal, mobileNumber: phoneNumber)               )
                print("\(phoneNumber)sucess")
            }else if strVal == "property" {
                print("Property")
                RegisterService.sharedInstance.callingApiPost(register: RegisterModel(sign_up_by: strVal, mobileNumber: phoneNumber))
            }else if strVal == ""{
                alertError()
            }
        }else{
            alertErrorPhoneNumber()
        }
        
    }
    
    //    MARK:- ALERT FUNCTIONS FOR ERRORS
    
    //    alert for radio button non selection
    func alertError() {
        let alert = UIAlertController(title: "Error", message: "Choose USER or PROPERTY OWNER", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .destructive, handler: { _ in
            print("user or property owner is not selected")
        }))
        present(alert, animated: true, completion: nil)
    }
    //   alert for phone number validation
    func alertErrorPhoneNumber() {
        let alert = UIAlertController(title: "Error", message: "Please Enter 10 Digits Phone Number", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .destructive, handler: { _ in
            print("user or property owner is not selected")
        }))
        present(alert, animated: true, completion: nil)
    }
    
    //MARK:- CUSTOM TEXT
    
    func customTextField () {
        let phoneField = CALayer()
        phoneField.frame = CGRect( x: 0, y: phoneNumberTextField.frame.height, width: 229, height: 2)
        phoneField.backgroundColor = UIColor.black.cgColor
        
        //       remove textfield border
        phoneNumberTextField.borderStyle = .none
        
        //        addLine to textfield
        phoneNumberTextField.layer.addSublayer(phoneField)
    }
    
    //MARK:- NAVIGATION TO NEXT CONTROLLER
    
    func navAuth() {
        passingNumber = phoneNumberTextField.text!
        if postMessage == confirmNavsucess{
            let regVC = storyboard?.instantiateViewController(identifier: "register")  as! OTPRegisterSignUpViewController
            self.navigationController?.pushViewController(regVC, animated: true)
            regVC.recivingNumber = passingNumber
            
        }else if postMessage == confirmNavFailed{
            alertErrorNumberExist()
        }else{
            return
        }

    }
    
    func alertErrorNumberExist() {
        let alert = UIAlertController(title: "Error", message: "Number already exists", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .destructive, handler: { _ in
            print("user or property owner is not selected")
        }))
        present(alert, animated: true, completion: nil)
    }
}

extension SignUpOtpVC : PostResponse{
    func message(message: String?) {
        postMessage = message!
        navAuth()
    }
}

