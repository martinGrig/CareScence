//
//  UIBezierPathExtension.swift
//  CareScence
//
//  Created by JD Destine on 10/01/2020.
//  Copyright © 2020 JD Destine. All rights reserved.
//

import Foundation
import UIKit

extension UIBezierPath {
    convenience init(curvedSegment: CurvedSegment) {
        self.init()
        self.move(to: curvedSegment.startPoint)
        self.addCurve(to: curvedSegment.toPoint, controlPoint1: curvedSegment.controlPoint1, controlPoint2: curvedSegment.controlPoint2)
        self.addLine(to: curvedSegment.endPoint)
    }
    
    convenience init(lineSegment: LineSegment) {
        self.init()
        self.move(to: lineSegment.startPoint)
        self.addLine(to: lineSegment.endPoint)
    }
}
