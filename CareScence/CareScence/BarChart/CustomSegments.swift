//
//  CustomSegments.swift
//  CareScence
//
//  Created by JD Destine on 10/01/2020.
//  Copyright © 2020 JD Destine. All rights reserved.
//

import Foundation
import CoreGraphics.CGGeometry

struct CurvedSegment {
    let startPoint: CGPoint
    let endPoint: CGPoint
    let toPoint: CGPoint
    let controlPoint1: CGPoint
    let controlPoint2: CGPoint
}

struct LineSegment {
    let startPoint: CGPoint
    let endPoint: CGPoint
}

