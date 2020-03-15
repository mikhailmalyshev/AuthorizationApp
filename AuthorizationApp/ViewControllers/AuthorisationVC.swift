//
//  ViewController.swift
//  AuthorizationApp
//
//  Created by Михаил Малышев on 08/03/2020.
//  Copyright © 2020 Mikhail Malyshev. All rights reserved.
//

import UIKit

class AuthorisationVC: UIViewController {

    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    
    private let user = User.getUserData()
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if login.text == "" {
           openHelp(title: "Login is empty", text: "Please enter the login")
           return
       }
       if password.text == "" {
           openHelp(title: "Password is empty", text: "Please enter the password")
           return
       }
        if login.text != user.name || password.text != user.password {
           openHelp(title: "Incorrent Login/Password", text: "Please enter correct Login/Password")
           return
       }
        
        let tabBarController = segue.destination as! UITabBarController
        let vcWelcome = tabBarController.viewControllers?.first as! WelcomeVC
        vcWelcome.user = user
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        login.text = nil
        password.text = nil
    }
    
    @IBAction func forgotUserNameButtonPressed() {
        openHelp(title: "I can help you!", text: "Your name is \(user.name)!")
        
    }
    @IBAction func forgotPasswordButtonPressed() {
        openHelp(title: "I can help you!", text: "Your password - \(user.password)!")
        
    }
    
    
    @IBAction func logInButtonPressed() {
    }
    
}

extension AuthorisationVC {
    private func openHelp(title: String, text: String, textField: UITextField? = nil){
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Thank you!", style: .default) { _ in
            textField?.text = nil
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension AuthorisationVC: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == login {
            textField.resignFirstResponder()
            password.becomeFirstResponder()
        } else {
            logInButtonPressed()
        }
        return true
    }
}
