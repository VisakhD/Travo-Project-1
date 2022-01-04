//
//  SignUpDetailViewController.swift
//  Travo Project 1
//
//  Created by Visakh D on 17/12/21.
//

import UIKit


class SignUpDetailsViewController: UIViewController{
    var signUpId : String = ""
    var signUpToken : String = ""
    weak var rootDelgate : RootSwitching?
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        customTextFlied()
        RegisterService.sharedInstance.delegateID = self
        rootDelgate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
        
        nameTextField.customField()
        usernameTextField.customField()
        emailTextField.customField()
        passwordTextField.customField()
        confirmPasswordTextField.customField()
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
        
        if password == confirmPassword {
            let reg =   RegisterDetailsModel.init(name: name, user_name: username, userId: id, email: email, password: password)
               RegisterService.sharedInstance.postApiDetails(registerDetails: reg)
        }else {
            alertMessages(title: "Error", message: "Password Does Not Match")

        }
    }
    
    func signUpComplete() {
        if signUpToken != ""  {
           rootDelgate?.loginSucceed()
        }else  {
            alertMessages(title: "Error", message: "SignUp not completed Server Error")
            
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
extension SignUpDetailsViewController : PostRespondsSignInDetails {
    func ID(token: String?) {
        signUpToken = token!
        signUpComplete()
    }
}


