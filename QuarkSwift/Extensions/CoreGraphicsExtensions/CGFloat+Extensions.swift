//
//  CGFloat+Extensions.swift
//  whim-ios
//
//  Created by Do Duc on 31/10/2016.
//  Copyright © 2016 maas. All rights reserved.
//

import UIKit

extension CGFloat {
    /// Convert degrees value to radians value
    public func toRadians() -> CGFloat {
        return CGFloat(M_PI) * self / 180.0
    }
    
    /// Convert radians value to degrees value
    func toDegrees() -> CGFloat {
        return self * 180 / CGFloat(M_PI)
    }
    
    /// Quick access to screen width
    static var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    /// Quick access to screen width
    static var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    /// Ratio of current screen with phone 5 screen using width property, should be using for larger screen than iphone 5 (iphone 4/4s will return 1 due to same width)
    static var screenRatio: CGFloat {
        return UIScreen.main.bounds.width / 320
    }
}
