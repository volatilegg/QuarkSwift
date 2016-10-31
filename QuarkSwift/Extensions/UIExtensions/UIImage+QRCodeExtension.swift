//
//  UIImage+QRCodeExtension.swift
//  whim-ios
//
//  Created by Do Duc on 31/10/2016.
//  Copyright © 2016 maas. All rights reserved.
//

import UIKit

extension UIImage {
    class func generateQRCodeFromString(_ string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.isoLatin1)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            
            if let output = filter.outputImage?.applying(transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
}
