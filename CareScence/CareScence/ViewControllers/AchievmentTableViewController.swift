//
//  AchievmentTableViewController.swift
//  CareScence
//
//  Created by Student on 09/01/2020.
//  Copyright © 2020 JD Destine. All rights reserved.
//

import UIKit
import SAConfettiView

class AchievmentTableViewController: UITableViewController {

        var achievments: [Achievment] = [
            
            Achievment(title: "Gym Rat", assignment: "Have a 5 day exercise streak", photo: #imageLiteral(resourceName: "achievements - gym rat") , progress: 0.6,fake: 3, max: 5),
            Achievment(title: "Busy Bee", assignment: "Take 500 steps", photo: #imageLiteral(resourceName: "achievements - busy bee") , progress: 1, fake: 500, max: 500),
            Achievment(title: "Physician`s Favourite", assignment: "Never miss a pill for a week", photo: #imageLiteral(resourceName: "achievements - physician's pet") , progress: 0.7, fake: 5, max: 7),
            Achievment(title: "Defying Gravity", assignment: "Fall free for one month", photo: #imageLiteral(resourceName: "achievements - defying gravity") , progress: 0.15, fake: 5, max: 30)
            ]
    
    // Confetti variables.
    var timer: Timer?
    var timeLeft = 3
    var confettiView = SAConfettiView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CONFETTI.
        confettiView = SAConfettiView(frame: self.view.bounds)
        confettiView.type = .Confetti
        
        view.addSubview(confettiView)
        confettiView.startConfetti()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTick), userInfo: nil, repeats: true)

    }
    
    @objc func onTick()
       {
           if (timeLeft == 0)
           {
               timer?.invalidate()
               timer = nil
               confettiView.stopConfetti()
               confettiView.isUserInteractionEnabled = false
           }
           else
           {
               timeLeft -= 1
           }
       }
            
            
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
