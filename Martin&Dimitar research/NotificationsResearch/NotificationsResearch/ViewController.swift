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
          content.title = "Meal time"
          content.body = "The most important meal of the day! BREAKFAST!!!"
          
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
          
        notification("Meal Time", "Most important meal of the day! BREAKFAST!!!", 8, 30)
        notification("Meal Time", "Its time for lunch", 12, 30)
        notification("Meal Time", "Its time for snack", 16, 30)
        notification("Meal Time", "Its time for dinner", 19, 30)
        
        notification("Time to take your meds!", "Don`t forget to take care of your health", 10, 30)
        notification("Move your body!", "Did you do your exercise today", 14, 30)
        
    }
    func notification(_ title: String, _ body: String, _ hour: Int, _ minutes: Int){
        
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { granted, error in
            // Enable or disable features based on authorization.
        }
        
        let lunchContent = UNMutableNotificationContent()
          lunchContent.title = title
          lunchContent.body = body
          
          // Configure the recurring date.
          var lunchDateComponents = DateComponents()
          lunchDateComponents.calendar = Calendar.current

          //dateComponents.weekday = 5  // 3 = Tuesday
          lunchDateComponents.hour = hour   // hours
          lunchDateComponents.minute = minutes   // minutes
             
          // Create the trigger as a repeating event.
          let trigger = UNCalendarNotificationTrigger(
                   dateMatching: lunchDateComponents, repeats: true)
        
        // Create the request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString,
                    content: lunchContent, trigger: trigger)

        // Schedule the request with the system.
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
           if error != nil {
              // Handle any errors.
           }
        }
        
    }


}

