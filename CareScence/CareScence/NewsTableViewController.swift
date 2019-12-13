//
//  NewsTableViewController.swift
//  CareScence
//
//  Created by Student on 13/12/2019.
//  Copyright © 2019 JD Destine. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    var news: [Article] = [
        
        Article(title: "Eating a plant-based diet might help prevent type 2 diabetes, study suggests", author: "CNN health", photo: #imageLiteral(resourceName: "news-1")),
        Article(title: "Vigorous Exercise Can Greatly Reduce Your Risk of Cancer, Heart Disease", author: "healthline", photo: #imageLiteral(resourceName: "news-2")),
        Article(title: "Physical activity may protect against prostate cancer", author: "Medical News Today", photo: #imageLiteral(resourceName: "news-3")),
        Article(title: "ALDI Recalls Frozen Berries Over Potential Hepatitis A Contamination", author: "The Independent", photo: #imageLiteral(resourceName: "news-4"))
        ]
        
        
//        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            guard let detailsViewController = segue.destination as? AgendaDetailsViewController,
//                let index = tableView.indexPathForSelectedRow?.row
//                else {
//                    return
//            }
//            detailsViewController.event = news[index]
//        }
//        
//        func onUserAction(article: News){
//            
//            news.append(article)
//            let vc = DetailsViewController(nibName: "DetailsViewController", bundle: nil)
//            vc.agendaViewController = self
//            let indexPath = IndexPath(row: news.count - 1, section: 0)
//            tableView.insertRows(at: [indexPath], with: .automatic)
//        }
//        
    }

extension NewsTableViewController {
    

    
    
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return news.count
  }
  
  override func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let article = news[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell",
                                             for: indexPath) as! NewsTableViewCell
    cell.ImageView?.image = article.photo
    cell.Title?.text = article.title
    cell.Author?.text = article.author
    
    return cell
  }
    
    
}
