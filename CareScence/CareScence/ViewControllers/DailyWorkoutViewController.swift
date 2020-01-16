//
//  DailyWorkoutViewController.swift
//  CareScence
//
//  Created by Student on 09/01/2020.
//  Copyright © 2020 JD Destine. All rights reserved.
//

import UIKit

class DailyWorkoutViewController: UIViewController {
    
    var exercise: Exercise = Exercise(title: "Toe stand", photo: #imageLiteral(resourceName: "exercise-toe-stand") , url: "https://www.youtube.com/watch?v=04zZLGcrN5Y")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let exerciseWebViewController = segue.destination as? ExerciseWebViewController
                else {
                    return
            }
        exerciseWebViewController.exercise = self.exercise
        }
        
    }
    

