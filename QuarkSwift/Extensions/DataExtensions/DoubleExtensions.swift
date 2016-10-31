//
//  DoubleExtensions.swift
//  QuarkSwift
//
//  Created by Do Duc on 18/10/2016.
//  Copyright © 2016 Do Duc. All rights reserved.
//

import Foundation

extension Double {

    /// Convert degree value to radian
    public func toRadians() -> Double {
        return M_PI * self / 180.0
    }

    /// Convert radian value to degree
    public func toDegrees() -> Double {
        return self * 180 / M_PI
    }
}
