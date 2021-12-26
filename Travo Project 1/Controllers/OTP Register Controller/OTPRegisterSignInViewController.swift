//
//  OTPRegisterSignInViewController.swift
//  Travo Project 1
//
//  Created by Visakh D on 16/12/21.
//

import UIKit

class OTPRegisterSignInViewController: UIViewController {
    @IBOutlet weak var btn1: UITextField!
    @IBOutlet weak var btn2: UITextField!
    @IBOutlet weak var btn3: UITextField!
    @IBOutlet weak var btn4: UITextField!
    var otpCode : String? = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btn1.delegate = self
        self.btn2.delegate = self
        self.btn3.delegate = self
        self.btn4.delegate = self
        
        self.btn1.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
        self.btn2.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
        self.btn3.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
        self.btn4.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)

        // Do any additional setup after loading the view.
    }
    @objc func changeCharacter(textField : UITextField) {
        if textField.text?.utf8.count == 1 {
            switch textField {
            case btn1:
                btn2.becomeFirstResponder()
            case btn2:
                btn3.becomeFirstResponder()
            case btn3:
                btn4.becomeFirstResponder()
            case btn4:
                print(otpCode = "\(btn1.text!)\(btn2.text!)\(btn3.text!)\(btn4.text!)")
            default :
                break
                
            }
        }else if (textField.text!.isEmpty) {
            switch textField {
            case btn4:
                btn3.becomeFirstResponder()
            case btn3:
                btn2.becomeFirstResponder()
            case btn2:
                btn1.becomeFirstResponder()
            default :
                break
            }
            
        }
    }

    @IBAction func editPhoneNumbButton(_ sender: Any) {
    }
    
    @IBAction func sentAgainButton(_ sender: Any) {
    }
    
    @IBAction func submitButton(_ sender: Any) {
    }
    
}
extension OTPRegisterSignInViewController : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text!.utf16.count == 1 && !string.isEmpty {
            return false
        }else {
            return true
        }
    }
}

