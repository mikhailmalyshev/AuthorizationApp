//
//  User.swift
//  AuthorizationApp
//
//  Created by Михаил Малышев on 08/03/2020.
//  Copyright © 2020 Mikhail Malyshev. All rights reserved.
//

import Foundation

struct User {
    let name: String
    let password: String
    
    static func getUserData() -> User {
        User(name: "Misha", password: "Password")
    }
}
