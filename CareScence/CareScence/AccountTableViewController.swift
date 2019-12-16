//
//  AccountTableViewController.swift
//  CareScence
//
//  Created by Student on 15/12/2019.
//  Copyright © 2019 JD Destine. All rights reserved.
//

import UIKit

class AccountTableViewController: UITableViewController {
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    var user : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if segue.identifier == "SaveAccountDetail",
         let name = NameTextField.text,
         let email = EmailTextField.text,
         let password = PasswordTextField.text {
        user = User.init(name: name, email: email, password: password,  photo: #imageLiteral(resourceName: "happy") , emergencyContact: "")
     }
    
    
}
}
