//
//  StepData.swift
//  CareScence
//
//  Created by JD Destine on 16/01/2020.
//  Copyright © 2020 JD Destine. All rights reserved.
//

import Foundation
class StepData: Codable {
    let Steps: Int
    let Date: String
    init(Steps: Int, Date: String) {
        self.Steps = Steps
        self.Date = Date
    }
}
