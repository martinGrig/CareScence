//
//  SettingsTableViewController.swift
//  CareScence
//
//  Created by Student on 14/12/2019.
//  Copyright © 2019 JD Destine. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var EmailLabel: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var MedicationSwitch: UISwitch!
    @IBOutlet weak var ExerciseSwitch: UISwitch!
    
    
    var account: User? = User(name: "Jack Smith", email: "j.smith@yahooo.com", password: "bunnies", photo: #imageLiteral(resourceName: "happy") , emergencyContact: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NameLabel.text = account!.name
        EmailLabel.text = account!.email
        ImageView.image = account!.photo
    }
        

        
        
        
//
//        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd.MM.yyyy"
//         let formatterr = DateFormatter()
//         formatterr.dateFormat = "HH:mm"
//         let datee = formatter.string(from: DateDatePicker.date)
//         let timee = formatterr.string(from: DateDatePicker.date)
//         let textfieldInt: Int? = Int(EntryLimitTextField.text!)
//         let textfieldFloat: Double? = Double(EntryCostTextField.text!)
//         if segue.identifier == "SavePlayerDetail",
//             let name = NameTextField.text,
//             let location = LocationLabel.text,
//             let details = DetailsTextField.text {
//             event = Event.init(name: name, location: location, date: datee, time: timee, entryLimit: textfieldInt!, entryCost: textfieldFloat!, bio: details, photo: image)
//         }
            
            
            
            
//    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let webViewController = segue.destination as? WebViewController,
//            let index = tableView.indexPathForSelectedRow?.row
//            else {
//                return
//        }
//        webViewController.article = news[index]
//    }
    

}

extension SettingsTableViewController{
    @IBAction func cancelToSettingsTableViewController(_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func saveAccountDetail(_ segue: UIStoryboardSegue) {
        
        
        guard let accountTableViewController = segue.source as? AccountTableViewController,
            let user = accountTableViewController.user else {
                return
        }
        
        account = user
        NameLabel.text = account!.name
        EmailLabel.text = account!.email
        ImageView.image = account!.photo
    }
}
