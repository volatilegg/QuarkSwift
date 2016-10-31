//
//  UIButton+Extensions.swift
//  whim-ios
//
//  Created by Do Duc on 31/10/2016.
//  Copyright © 2016 maas. All rights reserved.
//

import UIKit

extension UIButton {
    func setButtonStatus(_ enabled: Bool) {
        self.isEnabled = enabled
        self.alpha = enabled ? 1.0 : 0.4
    }
    
    func setSpacing(_ spacing: CGFloat, withTopInset: CGFloat) {
        let insetAmount = spacing / 2
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount, bottom: 0, right: insetAmount)
        titleEdgeInsets = UIEdgeInsets(top: withTopInset, left: insetAmount, bottom: 0, right: -insetAmount)
        contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
    }
}
