//
//  AddMedicineTableViewController.swift
//  CareScence
//
//  Created by Student on 09.01.2020 г..
//  Copyright © 2020 JD Destine. All rights reserved.
//

import UIKit

class AddMedicineTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var MedName: UITextField!
    @IBOutlet weak var Frequency: UIPickerView!
    @IBOutlet weak var Time: UIDatePicker!
    var pickerData: [String] = [String]()
    
    var med : Medicine?
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.Frequency.delegate = self
        //self.Frequency.dataSource = self
        
        MedName.font = UIFont(name:"Avenir", size:17)

        pickerData = ["Once a day", "Twice a day", "Three times a day"]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    @IBOutlet weak var Monday: UISwitch!
    @IBOutlet weak var Tuesday: UISwitch!
    @IBOutlet weak var Wednesday: UISwitch!
    @IBOutlet weak var Thursday: UISwitch!
    @IBOutlet weak var Friday: UISwitch!
    @IBOutlet weak var Saturday: UISwitch!
    @IBOutlet weak var Sunday: UISwitch!
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    // Capture the picker view selection
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveMedicineDetail"{
            //let d = Frequency.delegate
            let name = MedName.text
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            let time = formatter.string(from: Time.date)
            var frequency = [""]
            
            if Monday.isOn{
                frequency.append("Monday")
                
            }
            if Tuesday.isOn{
                frequency.append("Tuesday")
                
            }
            if Wednesday.isOn{
                frequency.append("Wednesday")
                
            }
            if Thursday.isOn{
                frequency.append("Thursday")
                
            }
            if Friday.isOn{
                frequency.append("Friday")
                
            }
            if Saturday.isOn{
                frequency.append("Saturday")
                
            }
            if Sunday.isOn{
                frequency.append("Sunday")
                
            }
            med = Medicine.init(name: name!, day: frequency, time: time, frequency:"")
            
            
            
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
}
extension AddMedicineTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            MedName.becomeFirstResponder()
        }
}
}
