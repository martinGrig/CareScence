//
//  EmergencyContactViewController.swift
//  CareScence
//
//  Created by Student on 16/12/2019.
//  Copyright © 2019 JD Destine. All rights reserved.
//

import UIKit

class EmergencyContactViewController: UIViewController {
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var EmailLabel: UILabel!
    @IBOutlet weak var PhoneLabel: UILabel!
    
    fileprivate var application = UIApplication.shared
    

    var emergency = EmergencyContact(name: "Jane Smith", email: "jane@abv.cr", photo: #imageLiteral(resourceName: "emergency-contact"), phoneNumber: "0031612345678")
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func CallTpped(_ sender: Any) {
        
        if let phoneURL = URL(string: "tel://\(emergency.phoneNumber)"){
            if application.canOpenURL(phoneURL){
                application.open(phoneURL, options:  [:], completionHandler: nil)
                print("works")
            }else{
//                alert
            }
        }
    }
    

}

extension EmergencyContactViewController{
    @IBAction func cancelToEmergencyContactTableViewController(_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func saveContactDetail(_ segue: UIStoryboardSegue) {
        
        
        guard let emInfoTableViewController = segue.source as? EmergencyInfoTableViewController,
            let contact = emInfoTableViewController.contact else {
                return
        }
        
        emergency = contact
        NameLabel.text = emergency.name
        EmailLabel.text = emergency.email
        PhoneLabel.text = emergency.phoneNumber
        ImageView.image = emergency.photo
    }
}

