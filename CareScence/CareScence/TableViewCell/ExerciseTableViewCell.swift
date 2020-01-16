//
//  ExerciseTableViewCell.swift
//  CareScence
//
//  Created by Student on 13/12/2019.
//  Copyright © 2019 JD Destine. All rights reserved.
//

import UIKit

class ExerciseTableViewCell: UITableViewCell {
    @IBOutlet weak var ImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    var exercise: Exercise? {
      didSet {
        guard exercise != nil else { return }

//        Title.text = exercise.title
        ImageView.image = image()
      }
    }

    func image() -> UIImage? {
      let imageName = "exercise-toe-stand"
      return UIImage(named: imageName)
    }

}
