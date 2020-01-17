//
//  ExerciseTableViewController.swift
//  CareScence
//
//  Created by Student on 13/12/2019.
//  Copyright © 2019 JD Destine. All rights reserved.
//

import UIKit

class ExerciseTableViewController: UITableViewController {

    var exercises: [Exercise] = [

    Exercise(title: "Heel-to-toe", photo: #imageLiteral(resourceName: "exercise-heel-to-toe-walk") , url: "https://www.youtube.com/watch?v=z_GKdFf3qv4"),
    Exercise(title: "Toe stand", photo: #imageLiteral(resourceName: "exercise-toe-stand") , url: "https://www.youtube.com/watch?v=04zZLGcrN5Y"),
    Exercise(title: "Back Stretch", photo: #imageLiteral(resourceName: "exercise-back-stretch") , url: "https://www.youtube.com/watch?v=FpIfMyfpCk0"),
    Exercise(title: "Hand Grip", photo: #imageLiteral(resourceName: "exercise-hand-grip"), url: "https://www.youtube.com/watch?v=kgqIdCwVivE")
    ]

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                guard let exerciseWebViewController = segue.destination as? ExerciseWebViewController,
                    let index = tableView.indexPathForSelectedRow?.row
                    else {
                        return
                }
                exerciseWebViewController.exercise = exercises[index]
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

    extension ExerciseTableViewController {
        

        
        
      override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
      }
      
      override func tableView(_ tableView: UITableView,
                              cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let exercise = exercises[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell",
                                                 for: indexPath) as! ExerciseTableViewCell
        cell.ImageView?.image = exercise.photo
        
        return cell
      }
        
        
    }
