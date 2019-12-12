//
//  ViewController.swift
//  NotificationsResearch
//
//  Created by Student on 12.12.2019 г..
//  Copyright © 2019 Dimitar Ivanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func sendNotification(_ sender: Any) {
        let content = UNMutableNotificationContent()
          content.title = "Weekly Staff Meeting"
          content.body = "Every Tuesday at 2pm"
          
          // Configure the recurring date.
          var dateComponents = DateComponents()
          dateComponents.calendar = Calendar.current

          //dateComponents.weekday = 5  // 3 = Tuesday
          dateComponents.hour = 11    // hours
          dateComponents.minute = 12   // minutes
             
          // Create the trigger as a repeating event.
          let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        // Create the request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString,
                    content: content, trigger: trigger)

        // Schedule the request with the system.
        UNUserNotificationCenter.current().add(request) { (error) in
           if error != nil {
              // Handle any errors.
           }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { granted, error in
            // Enable or disable features based on authorization.
        }
          let content = UNMutableNotificationContent()
          content.title = "Weekly Staff Meeting"
          content.body = "Every Tuesday at 2pm"
          
          // Configure the recurring date.
          var dateComponents = DateComponents()
          dateComponents.calendar = Calendar.current

          //dateComponents.weekday = 5  // 3 = Tuesday
          dateComponents.hour = 11    // hours
          dateComponents.minute = 17   // minutes
             
          // Create the trigger as a repeating event.
          let trigger = UNCalendarNotificationTrigger(
                   dateMatching: dateComponents, repeats: true)
        
        // Create the request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString,
                    content: content, trigger: trigger)

        // Schedule the request with the system.
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
           if error != nil {
              // Handle any errors.
           }
        }
    }


}

