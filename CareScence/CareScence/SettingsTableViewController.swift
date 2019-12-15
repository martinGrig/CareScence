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
    
    
    var user: User = User(name: "Jack Smith", email: "j.smith@yahooo.com", password: "bunnies", photo: #imageLiteral(resourceName: "happy") )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NameLabel.text = user.name
        EmailLabel.text = user.email
        ImageView.image = user.photo
        

    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let webViewController = segue.destination as? WebViewController,
//            let index = tableView.indexPathForSelectedRow?.row
//            else {
//                return
//        }
//        webViewController.article = news[index]
//    }
    

}
