//
//  MedicineTableViewController.swift
//  CareScence
//
//  Created by Student on 09.01.2020 г..
//  Copyright © 2020 JD Destine. All rights reserved.
//

import UIKit

class MedicineTableViewController: UITableViewController {

            

    var medicines: [Medicine] = [Medicine(name: "Vitamin C", day: ["Tuesday"], time: "11:00", frequency: "")
    ]


    
}
extension MedicineTableViewController{
@IBAction func cancelToMedicineTableViewController(_ segue: UIStoryboardSegue) {
}

@IBAction func saveMedicineDetail(_ segue: UIStoryboardSegue) {
    
    
    guard let AddMedicineTableViewController = segue.source as? AddMedicineTableViewController,
        let med = AddMedicineTableViewController.med else {
            return
    }
    
    medicines.append(med)
    
    let indexPath = IndexPath(row: medicines.count - 1, section: 0)
    tableView.insertRows(at: [indexPath], with: .automatic)
}
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return medicines.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let medicine = medicines[indexPath.row]
      let cell = tableView.dequeueReusableCell(withIdentifier: "MedicineCell",
                                               for: indexPath) as! MedicineTableViewCell
        var b = medicine.day
        var a = ""
        a = b.joined(separator:" ")
        cell.Name.text = medicine.name
        cell.Date.text = a
        cell.Time.text = medicine.time
      cell.Frequency?.text = medicine.frequency
        
      return cell
    }
    
    
    
    
}
