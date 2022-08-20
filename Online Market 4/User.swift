//
//  User.swift
//  Online Market 4
//
//  Created by Ilxom on 18/08/22.
//

import Foundation

struct User {
    let email: String
    let password: String
    
    static func getUserData() -> User {
        User(email: "", password: "")
    }
}
