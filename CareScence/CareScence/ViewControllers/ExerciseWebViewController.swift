//
//  ExerciseWebViewController.swift
//  CareScence
//
//  Created by Student on 13/12/2019.
//  Copyright © 2019 JD Destine. All rights reserved.
//

import UIKit
import WebKit

class ExerciseWebViewController: UIViewController {
    @IBOutlet weak var WebView: WKWebView!
    
    var exercise : Exercise?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: exercise!.url)
        
        WebView.load(URLRequest(url: url!))
    }
    
    @IBAction func SharePressed(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [exercise!.url], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)

    }
}
    
