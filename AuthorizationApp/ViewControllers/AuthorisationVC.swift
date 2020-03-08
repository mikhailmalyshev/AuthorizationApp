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
    
    var user : User?
    var loginFromAuthorisationVC: String!
    var passwordFromAuthorisationVC: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        login.text = loginFromAuthorisationVC
        password.text = passwordFromAuthorisationVC
        
        user = User(name: "Misha", password: "Password")
        login.delegate = self as? UITextFieldDelegate
        password.delegate = self as? UITextFieldDelegate
    }

    @IBAction func forgotUserNameButtonPressed() {
    openHelp(title: "I can help you!", text: "Your name is Misha!")
        
    }
    @IBAction func forgotPasswordButtonPressed() {
        openHelp(title: "I can help you!", text: "Your password - Password!")
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if login.text == "" {
           openHelp(title: "Login is empty", text: "Please enter the login")
           return
       }
       if password.text == "" {
           openHelp(title: "Password is empty", text: "Please enter the password")
           return
       }
       if login.text != user?.name || password.text != user?.password {
           openHelp(title: "Incorrent Login/Password", text: "Please enter correct Login/Password")
           return
       }
        
        let tabBarController = segue.destination as! UITabBarController
        let vcWelcome = tabBarController.viewControllers?.first as! WelcomeVC
        vcWelcome.user = user
    }
    
}

extension AuthorisationVC {
    private func openHelp(title: String, text: String){
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Thank you!", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

