//
//  AchievmentTableViewController.swift
//  CareScence
//
//  Created by Student on 09/01/2020.
//  Copyright © 2020 JD Destine. All rights reserved.
//

import UIKit

class AchievmentTableViewController: UITableViewController {

        var achievments: [Achievment] = [
            
            Achievment(title: "Gym Rat", assignment: "Have a 5 day exercise streak", photo: #imageLiteral(resourceName: "achievements - gym rat") , progress: 0.6,fake: 3, max: 5),
            Achievment(title: "Busy Bee", assignment: "Take 1000 steps", photo: #imageLiteral(resourceName: "achievements - busy bee") , progress: 0.94, fake: 946, max: 1000),
            Achievment(title: "Physician`s Favourite", assignment: "Never miss a pill for a week", photo: #imageLiteral(resourceName: "achievements - physician's pet") , progress: 0.7, fake: 5, max: 7),
            Achievment(title: "Defying Gravity", assignment: "Fall free for one month", photo: #imageLiteral(resourceName: "achievements - defying gravity") , progress: 0.15, fake: 5, max: 30)
            ]
            
            
//            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//                guard let webViewController = segue.destination as? WebViewController,
//                    let index = tableView.indexPathForSelectedRow?.row
//                    else {
//                        return
//                }
//                webViewController.article = news[index]
//            }
            
    //        func onUserAction(article: Article){
    //
    //            news.append(article)
    //            let vc = WebViewController(nibName: "WebViewController", bundle: nil)
    //            vc.webViewController = self
    //            let indexPath = IndexPath(row: news.count - 1, section: 0)
    //            tableView.insertRows(at: [indexPath], with: .automatic)
    //        }
            
        }

    extension AchievmentTableViewController {
        

        
        
      override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return achievments.count
      }
      
      override func tableView(_ tableView: UITableView,
                              cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let achievment = achievments[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "AchievmentCell",
                                                 for: indexPath) as! AchievmentTableViewCell
        cell.ImageView?.image = achievment.photo
        cell.TitleLabel?.text = achievment.title
        cell.AssignmentLabel?.text = achievment.assignment
//        cell.ProgressView.progress = Float(achievment.progress)
        cell.ProgressView.setProgress(achievment.progress, animated: true)
        cell.ProgressLabel.text = String(achievment.fake) + "/" + String(achievment.max)
        
        return cell
      }
        
        
    }
