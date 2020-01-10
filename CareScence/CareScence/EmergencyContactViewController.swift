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
    

    var emergency = EmergencyContact(name: "Jane Smith", email: "jane@abv.cr", photo: #imageLiteral(resourceName: "happy"), phoneNumber: "+31 6 12345678")
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func CallEmergency(_ sender: Any) {
        emergency.phoneNumber.makeAColl()
    }
    

}
extension String {

    enum RegularExpressions: String {
        case phone = "^\\s*(?:\\+?(\\d{1,3}))?([-. (]*(\\d{3})[-. )]*)?((\\d{3})[-. ]*(\\d{2,4})(?:[-.x ]*(\\d+))?)\\s*$"
    }

    func isValid(regex: RegularExpressions) -> Bool { return isValid(regex: regex.rawValue) }
    func isValid(regex: String) -> Bool { return range(of: regex, options: .regularExpression) != nil }

    func onlyDigits() -> String {
        let filtredUnicodeScalars = unicodeScalars.filter { CharacterSet.decimalDigits.contains($0) }
        return String(String.UnicodeScalarView(filtredUnicodeScalars))
    }

    func makeAColl() {
        guard   isValid(regex: .phone),
                let url = URL(string: "tel://\(self.onlyDigits())"),
                UIApplication.shared.canOpenURL(url) else { return }
        if #available(iOS 10, *) {
            UIApplication.shared.open(url)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
}
