//
//  WalkingAnalysisPageViewController.swift
//  CareScence
//
//  Created by Student on 10/01/2020.
//  Copyright © 2020 JD Destine. All rights reserved.
//

import UIKit

class WalkingAnalysisPageViewController: UIPageViewController, UIPageViewControllerDataSource {

    lazy var pageViewConrollerList:[UIViewController] = {
       
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let vc1 = sb.instantiateViewController(withIdentifier: "GraphAnalysis")
        let vc2 = sb.instantiateViewController(withIdentifier: "TextAnalysis")
        
        return [vc1, vc2]
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        
        if let firstVC = pageViewConrollerList.first{
            self.setViewControllers([firstVC], direction: .forward, animated: true , completion: nil)
            
            
        }
    }
    

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = pageViewConrollerList.index(of: viewController) else {return nil}
        let previousIndex = vcIndex - 1
        guard previousIndex >= 0 else {return nil}
        guard pageViewConrollerList.count > previousIndex else {return nil}
        return pageViewConrollerList[previousIndex]
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = pageViewConrollerList.index(of: viewController) else {return nil}
        let nextIndex = vcIndex + 1
        guard pageViewConrollerList.count != nextIndex else {return nil}
        guard pageViewConrollerList.count > nextIndex else {return nil}
        return pageViewConrollerList[nextIndex ]
    }
    
}
