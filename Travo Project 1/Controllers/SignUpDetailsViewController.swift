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

        // Do any additional setup after loading the view.
    }
    

    @IBAction func submitNavButton(_ sender: Any) {
        let name = nameTextField.text!
        let username = usernameTextField.text!
        let email = emailTextField.text!
        let password = passwordTextField.text!
        let confirmPassword = confirmPasswordTextField.text!
        
       let postMet = RegisterDetailsModel.init(name: name, user_name: username, userId: signUpId, email: email, password: password)
        RegisterService.sharedInstance.postApiDetails(registerDetails: postMet)
    }
    

}
extension SignUpDetailsViewController: PostResponse{
    func message(message: String?, id: String?) {
        signUpId = id!
    }
    
    
}

