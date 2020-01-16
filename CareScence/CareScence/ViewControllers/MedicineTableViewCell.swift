//
//  MedicineTableViewCell.swift
//  CareScence
//
//  Created by Student on 16.01.2020 г..
//  Copyright © 2020 JD Destine. All rights reserved.
//

import UIKit

class MedicineTableViewCell: UITableViewCell {

    
   
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var Time: UILabel!
    @IBOutlet weak var Frequency: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    var medicine: Medicine? {
      didSet {
        guard let medicine = medicine else { return }
        var b = medicine.day
        var a = ""
        a = b.joined(separator:" ")
        Name.text = medicine.name
        Date.text = a
        Time.text = medicine.time
        Frequency.text = medicine.frequency
        
      }
    }
    
    
    
}
