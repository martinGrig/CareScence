//
//  EmergencyInfoTableViewController.swift
//  CareScence
//
//  Created by Student on 16/01/2020.
//  Copyright © 2020 JD Destine. All rights reserved.
//

import UIKit

class EmergencyInfoTableViewController: UITableViewController {
    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var EmailField: UITextField!
    @IBOutlet weak var PhoneField: UITextField!
    
    var contact : EmergencyContact?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SaveContactDetail"{
            let name = NameField.text
            let email = EmailField.text
            let phone = PhoneField.text
            contact = EmergencyContact.init(name: name!, email: email!, photo: #imageLiteral(resourceName: "emergency_pic") , phoneNumber: phone!)
     }
}
}
