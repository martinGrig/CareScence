//
//  DailyWorkoutViewController.swift
//  CareScence
//
//  Created by Student on 09/01/2020.
//  Copyright © 2020 JD Destine. All rights reserved.
//

import UIKit

class DailyWorkoutViewController: UIViewController {
    
    @IBOutlet weak var dailyWorkout2ImageView: UIImageView!
    @IBOutlet weak var dailyWorkout2Button: UIButton!
    
    @IBOutlet weak var nrOfWorkoutsLabel: UILabel!
    @IBOutlet weak var progressCircleImageView: UIImageView!
    
    weak var delegate: VCDelegate?

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
        
        // Update progress circle and text.
        DailyWorkout.shared.dailyDone = 2
        nrOfWorkoutsLabel.text = "2/2"
        progressCircleImageView.image = #imageLiteral(resourceName: "progress circle-full")
        // Disable the second exercise.
        dailyWorkout2ImageView.alpha = 0.5
        dailyWorkout2Button.isEnabled = false
        // Change daily exercise button on overview page.
        self.delegate?.dailyWorkoutsDone(sender:self)
        
        exerciseWebViewController.exercise = self.exercise
        }
        
    }
    

