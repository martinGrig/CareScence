//
//  ViewController.swift
//  CareScence
//
//  Created by JD Destine on 12/12/2019.
//  Copyright © 2019 JD Destine. All rights reserved.
//
import UIKit
import WebKit

protocol VCDelegate: class{
   func dailyWorkoutsDone(sender: DailyWorkoutViewController)
}

class ViewController: UIViewController, VCDelegate {
    
    @IBOutlet weak var dailyWorkoutLabel: UILabel!
    @IBOutlet weak var dailyWorkoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Notifications.
        notification("Meal Time", "Most important meal of the day! BREAKFAST!!!", 8, 30)
        notification("Meal Time", "Its time for lunch", 12, 30)
        notification("Meal Time", "Its time for snack", 16, 30)
        notification("Meal Time", "Its time for dinner", 21, 59)
        
        notification("Time to take your meds!", "Don`t forget to take care of your health", 10, 30)
        notification("Move your body!", "Did you do your exercise today", 14, 48)
        
        // Change exercise button color.
        switch(DailyWorkout.shared.dailyDone)
        {
        case 0:
            dailyWorkoutButton.backgroundColor = #colorLiteral(red: 1, green: 0.3725112081, blue: 0.3980468512, alpha: 1)
            break
            
        case 1:
            dailyWorkoutButton.backgroundColor = #colorLiteral(red: 1, green: 0.9366633296, blue: 0.287689209, alpha: 1)
            break
            
        case 2:
            dailyWorkoutButton.backgroundColor = #colorLiteral(red: 0.7751188874, green: 0.9150382876, blue: 0.4332845807, alpha: 1)
            break
            
        default:
            break
        }
        
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
        
    func dailyWorkoutsDone(sender: DailyWorkoutViewController) {
        self.dailyWorkoutLabel.text = "2/2"
        self.viewDidLoad()
        print("delegate func called!!!")
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?)
    {
        if event?.subtype == UIEvent.EventSubtype.motionShake
        {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let EmergencyContactViewController = storyBoard.instantiateViewController(withIdentifier: "emergencyContactViewController") as! EmergencyContactViewController
            self.present(EmergencyContactViewController, animated: true, completion: nil)
        }
    }
    
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // Get the new view controller using segue.destinationViewController.
           // Pass the selected object to the new view controller.
           if segue.identifier == "goToDailyWorkouts" {
               let vc : DailyWorkoutViewController = segue.destination as! DailyWorkoutViewController
               vc.delegate = self
           }
       }
}

extension UINavigationBar {
    func changeFont() {
        self.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont(name: "Avenir-Black", size: 34)!]
    }
}
