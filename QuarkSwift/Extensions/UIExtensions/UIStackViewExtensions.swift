//
//  UIStackViewExtensions.swift
//  QuarkSwift
//
//  Created by Do Duc on 18/10/2016.
//  Copyright © 2016 Do Duc. All rights reserved.
//

import UIKit

@available(iOS 9.0, *)
extension UIStackView {

    ///Remove all subview of the stack view
    public func removeAllSubViews() {
        for subview in arrangedSubviews {
            subview.removeFromSuperview()
        }
    }
}
