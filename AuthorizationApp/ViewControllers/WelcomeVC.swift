//
//  WelcomeVC.swift
//  AuthorizationApp
//
//  Created by Михаил Малышев on 08/03/2020.
//  Copyright © 2020 Mikhail Malyshev. All rights reserved.
//
import UIKit

class WelcomeVC: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(user?.name ?? "User")!"
    }
    
}
