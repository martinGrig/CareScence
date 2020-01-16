//
//  WebViewController.swift
//  CareScence
//
//  Created by Student on 13/12/2019.
//  Copyright © 2019 JD Destine. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet weak var WbView: WKWebView!
    
    
    var article : Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: article!.url)
        
        WbView.load(URLRequest(url: url!))
    }
    
    
    
    @IBAction func SharePressed(_ sender: Any) {
        
        let activityVC = UIActivityViewController(activityItems: [article!.url], applicationActivities: nil)
        
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
        
    }
    
    
}
