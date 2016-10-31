//
//  UIColorExtensions.swift
//  QuarkSwift
//
//  Created by Do Duc on 18/10/2016.
//  Copyright © 2016 Do Duc. All rights reserved.
//

import UIKit

extension UIColor {
    /// Init color with rgb value, return nil if value is invalid
    public convenience init(redValue: Int, greenValue: Int, blueValue: Int, alphaValue: Double = 1.0) {
        if redValue > 255 || greenValue > 255 || blueValue > 255 || alphaValue > 1.0 || alphaValue < 0.0 {
            self.init(white: 1.0, alpha: 1.0)
            return
        }

        self.init(red: CGFloat(redValue)/255.0, green: CGFloat(greenValue)/255.0, blue: CGFloat(blueValue)/255.0, alpha: CGFloat(alphaValue))
    }

    /// Init color with hex string
    public convenience init(hexString: String) {
        var hexString = hexString

        if hexString.hasPrefix("#") {
            hexString = hexString.substring(startIndex: 1)
        }

        guard hexString.length == 6 || hexString.length == 8 else {
            self.init(white: 1.0, alpha: 0.0)
            return
        }

        if hexString.length == 6 {
            hexString = "\(hexString)FF"
        }

        let scanner = Scanner(string: hexString)
        var rgbaValue: UInt32 = 0
        if scanner.scanHexInt32(&rgbaValue) {
            let red = (rgbaValue & 0xFF000000) >> 24
            let green = (rgbaValue & 0x00FF0000) >> 16
            let blue = (rgbaValue & 0x0000FF00) >> 8
            let alpha = rgbaValue & 0x000000FF

            self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0,
                      blue: CGFloat(blue) / 255.0, alpha: CGFloat(alpha) / 255.0)
        } else {
            self.init(white: 1.0, alpha: 1.0)
        }
    }
}
