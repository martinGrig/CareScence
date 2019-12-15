//
//  User.swift
//  CareScence
//
//  Created by Student on 15/12/2019.
//  Copyright © 2019 JD Destine. All rights reserved.
//

import Foundation
import UIKit

struct User{
    var name: String
    var email: String
    var password: String
    let photo: UIImage
    
    mutating func changeName(name: String){
        self.name = name
    }
    mutating func changeEmail(email: String){
        self.email = email
    }
    mutating func changePass(pass: String){
        self.password = pass
    }
}
