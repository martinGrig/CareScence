//
//  AccountTableViewController.swift
//  CareScence
//
//  Created by Student on 15/12/2019.
//  Copyright © 2019 JD Destine. All rights reserved.
//

import UIKit
import AVFoundation

class AccountTableViewController: UITableViewController,  UINavigationControllerDelegate, UIImagePickerControllerDelegate  {
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    var Uphoto : UIImage?
   
    
    
    @IBAction func TakePic(_ sender: Any) {
        let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
        
        switch cameraAuthorizationStatus {
               case .notDetermined: requestCameraPermission()
               case .authorized: presentCamera()
               case .restricted, .denied: alertCameraAccessNeeded()
               }
               requestCameraPermission()
               presentCamera()
    }        
func alertCameraAccessNeeded() {
    let settingsAppURL = URL(string: UIApplication.openSettingsURLString)!
 
  let alert = UIAlertController(
         title: "Need Camera Access",
         message: "Camera access is required to make full use of this app.",
         preferredStyle: UIAlertController.Style.alert
     )
 
    alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
    alert.addAction(UIAlertAction(title: "Allow Camera", style: .cancel, handler: { (alert) -> Void in
        UIApplication.shared.open(settingsAppURL, options: [:], completionHandler: nil)
    }))

    self.present(alert, animated: true, completion: nil)
}
  
     func requestCameraPermission() {
               AVCaptureDevice.requestAccess(for: .video, completionHandler: {accessGranted in
                  guard accessGranted == true else { return }
                  self.presentCamera()
            })
            }
    //
    var user : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SaveAccountDetail"{
            let name = NameTextField.text
            let email = EmailTextField.text
            let password = PasswordTextField.text
            
            user = User.init(name: name!, email: email!, password: password!,  photo: self.Uphoto! , emergencyContact: "")
     }
    
    
}

func presentCamera() {
   let photoPicker = UIImagePickerController()
photoPicker.sourceType = .camera
    photoPicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate

    self.present(photoPicker, animated: true, completion: nil)
    
}
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    let photo = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
    
    // do something with the photo... set to UIImageView, save it, etc.
    self.Uphoto = photo
    
    

   dismiss(animated: true, completion: nil)
}
}
