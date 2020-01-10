//
//  ViewController.swift
//  CareScence
//
//  Created by JD Destine on 12/12/2019.
//  Copyright © 2019 JD Destine. All rights reserved.
//
import UIKit
import WebKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // Notifications.
        notification("Meal Time", "Most important meal of the day! BREAKFAST!!!", 8, 30)
        notification("Meal Time", "Its time for lunch", 12, 30)
        notification("Meal Time", "Its time for snack", 16, 30)
        notification("Meal Time", "Its time for dinner", 21, 59)
        
        notification("Time to take your meds!", "Don`t forget to take care of your health", 10, 30)
        notification("Move your body!", "Did you do your exercise today", 14, 48)
        
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
        // Do any additional setup after loading the view.
        //let myUrl = URL(string: "https://www.youtube.com/watch?v=0bmE9XY3sOc")!
                
             //let myRequest = URLRequest(url:myUrl)
           //  webkit.load(myRequest)
            
            
            
}

extension ViewController{
    @IBAction func cancelToViewController(_ segue: UIStoryboardSegue) {
    }

    @IBAction func saveSettingsDetail(_ segue: UIStoryboardSegue) {

        guard let settingsViewController = segue.source as? SettingsTableViewController,
            let setting = settingsViewController.account else {
                return
        }
    }
}

extension UINavigationBar {
    func changeFont() {
        self.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont(name: "Avenir-Black", size: 34)!]
    }
}
