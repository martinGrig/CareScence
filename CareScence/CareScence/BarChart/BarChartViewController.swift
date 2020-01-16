//
//  BarChartViewController.swift
//  CareScence
//
//  Created by JD Destine on 10/01/2020.
//  Copyright © 2020 JD Destine. All rights reserved.
//

import UIKit

class BarChartViewController: UIViewController {

  let url = "https://api.myjson.com/bins/xn3qe"
    var DataStep = [StepData]()
    
    @IBOutlet weak var basicBarChart: BasicBarChart!
    
    
      
    
    
        
    override func viewDidAppear(_ animated: Bool) {
        downloadJson()
        
          let dataEntries = generateEmptyDataEntries()
          basicBarChart.updateDataEntries(dataEntries: dataEntries, animated: false)
          
          let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {[unowned self] (timer) in
            let dataEntries = self.generateRandomDataEntries();              self.basicBarChart.updateDataEntries(dataEntries: dataEntries, animated: true)
          }
          timer.fire()
        
      }
      
        
        func generateEmptyDataEntries() -> [DataEntry] {
            downloadJson()
            var result: [DataEntry] = []
            Array(0..<15).forEach {_ in
                result.append(DataEntry(color: UIColor.clear, height: 0, textValue: "0", title: ""))
            }
            return result
        }
    
    func downloadJson(){
        guard let downloadURL = URL(string: url) else {return}
       
        URLSession.shared.dataTask(with: downloadURL) { (data, urlResponse , error) in
            guard let data = data else {return}
            
          do{
                        let stepdata = try
                            JSONDecoder().decode([StepData].self, from: data)
            self.DataStep = stepdata
            
            for StepData in self.DataStep {
                print(StepData.Steps)
            }
            
          }catch let jsonErr{
            print("Error serializing json: ",jsonErr)
            }
        }.resume()
        
    }
        

            
            func generateRandomDataEntries() -> [DataEntry] {
                let colors = [#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)]
                           var num = 0;
                           var result: [DataEntry] = []
                           var value = 500


                for i in 0..<self.DataStep.count {
                    value = self.DataStep[i].Steps

                    
                    if(value > 5000){
                        num = 0
                    }else if (value < 3000){
                        num = 5
                    }else{
                        num = 3
                    }
                    
                                  
                               let height: Float = Float(value) / 10000.0

                               let formatter = DateFormatter()
                               formatter.dateFormat = "d MMM"
//                    var date = self.DataStep[i].Date
//                                                result.append(DataEntry(color: colors[num], height: height, textValue: "\(value)", title: date))
                               var date = Date()
                               date.addTimeInterval(TimeInterval(24*60*60*(-15+i)))
                               result.append(DataEntry(color: colors[num], height: height, textValue: "\(value)", title: formatter.string(from: date)))
                           }
                           return result
                       }
          }
           
    

