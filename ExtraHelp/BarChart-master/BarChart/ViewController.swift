//
//  ViewController.swift
//  BarChart
//
//  Created by Nguyen Vu Nhat Minh on 19/8/17.
//  Copyright © 2017 Nguyen Vu Nhat Minh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var basicBarChart: BasicBarChart!
    @IBOutlet weak var barChart: BeautifulBarChart!
    

      var lineChartEntry = [5200,4000,4500,4400,5100,5500, 5400,3000,3400,3200,4024,1900]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let dataEntries = generateEmptyDataEntries()
        basicBarChart.updateDataEntries(dataEntries: dataEntries, animated: false)
        barChart.updateDataEntries(dataEntries: dataEntries, animated: false)
        
        let timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) {[unowned self] (timer) in
            let dataEntries = self.generateRandomDataEntries()
            self.barChart.updateDataEntries(dataEntries: dataEntries, animated: true)
            self.basicBarChart.updateDataEntries(dataEntries: dataEntries, animated: true)
        }
        timer.fire()
    }
    
    func generateEmptyDataEntries() -> [DataEntry] {
        var result: [DataEntry] = []
        Array(0..<lineChartEntry.count).forEach {_ in
            result.append(DataEntry(color: UIColor.clear, height: 0, textValue: "0", title: ""))
        }
        return result
    }
    
    func generateRandomDataEntries() -> [DataEntry] {
        let colors = [#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.02807807196, blue: 0, alpha: 1)]
        var result: [DataEntry] = []
        for i in 0..<lineChartEntry.count {
            let value = lineChartEntry[i]
            let height: Float = Float(lineChartEntry[i]) / 10000.0
            
            let formatter = DateFormatter()
            formatter.dateFormat = "d MMM"
            var date = Date()
            var temp = 0;

            switch value {
            case 0...2000:
                temp = 2
            case 2001...4000:
                temp = 1
            case 4001...999999999:
                temp = 0
            default:
                temp = 0
                
            }
            
            date.addTimeInterval(TimeInterval(24*60*60*i))
            result.append(DataEntry(color: colors[temp], height: height, textValue: "\(value)", title: formatter.string(from: date)))
        }
        return result
    }
}

