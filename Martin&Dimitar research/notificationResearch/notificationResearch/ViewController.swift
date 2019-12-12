//
//  ViewController.swift
//  notificationResearch
//
//  Created by Student on 12/12/2019.
//  Copyright © 2019 Martin Grigorov. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    @IBAction func sendNotification(_ sender: Any) {
        // 1
        let content = UNMutableNotificationContent()
        content.title = "Time to walk"
        content.subtitle = "You haven't walked today"
        content.body = "500 steps left for today"
        
        // 2
        let imageName = "applelogo"
        guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "png") else { return }
        
        let attachment = try! UNNotificationAttachment(identifier: imageName, url: imageURL, options: .none)
        print(attachment)
        
        content.attachments = [attachment]
        
        // 3
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "notification.id.01", content: content, trigger: trigger)
        
        // 4
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) {
            (granted, error) in
            if granted {
                print("yes")
            } else {
                print("No")
            }
        }
    }


}


