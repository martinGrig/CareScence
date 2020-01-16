//
//  ArrayExtension.swift
//  CareScence
//
//  Created by JD Destine on 10/01/2020.
//  Copyright © 2020 JD Destine. All rights reserved.
//

import Foundation

extension Array {
    func safeValue(at index: Int) -> Element? {
        if index < self.count {
            return self[index]
        } else {
            return nil
        }
    }
}

