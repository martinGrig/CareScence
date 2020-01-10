//
//  NewsTableViewCell.swift
//  CareScence
//
//  Created by Student on 13/12/2019.
//  Copyright © 2019 JD Destine. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Author: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    

    var article: Article? {
      didSet {
        guard let article = article else { return }

        Title.text = article.title
        Author.text = article.author
        ImageView.image = image()
      }
    }

    func image() -> UIImage? {
      let imageName = "news-1"
      return UIImage(named: imageName)
    }

}
