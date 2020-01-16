//
//  AchievmentTableViewCell.swift
//  CareScence
//
//  Created by Student on 09/01/2020.
//  Copyright © 2020 JD Destine. All rights reserved.
//

import UIKit

class AchievmentTableViewCell: UITableViewCell {

    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var AssignmentLabel: UILabel!
    @IBOutlet weak var ProgressView: UIProgressView!
    @IBOutlet weak var ProgressLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ProgressView.transform = ProgressView.transform.scaledBy(x: 1, y: 5)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    

    var achievment: Achievment? {
      didSet {
        guard let achievment = achievment else { return }

        TitleLabel.text = achievment.title
        AssignmentLabel.text = achievment.assignment
//        ProgressView.progress = Float(achievment.progress)
        ImageView.image = image()
        ProgressView.setProgress(achievment.progress, animated: true)
        ProgressLabel.text = String(achievment.fake) + "/" + String(achievment.max)
      }
    }

    func image() -> UIImage? {
      let imageName = "news-1"
      return UIImage(named: imageName)
    }

}
