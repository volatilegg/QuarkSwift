//
//  UILabelExtensions.swift
//  QuarkSwift
//
//  Created by Do Duc on 18/10/2016.
//  Copyright © 2016 Do Duc. All rights reserved.
//

import UIKit

extension UILabel {

    /// Changing text with simple animation
    public func changeLabelTextWithAnimation(_ text: String?, attributeString: NSMutableAttributedString?) {
        self.fadeOut(duration: 0.2, delay: 0, completion: { (finished) in
            if let text = text {
                self.text = text
            } else if let attributeString = attributeString {
                self.attributedText = attributeString
            }

            self.fadeIn()
        })
    }
}
