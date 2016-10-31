//
//  UIViewExtensions.swift
//  QuarkSwift
//
//  Created by Do Duc on 18/10/2016.
//  Copyright © 2016 Do Duc. All rights reserved.
//

import UIKit

// MARK: Animation
extension UIView {

    /// Fade in animation with default duration 0.2s, can be use for one or more views at once
    class func fadeIn(_ views: [UIView], duration: TimeInterval = 0.2, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            for view in views {
                view.alpha = 1.0
            }
            }, completion: completion)
    }

    /// Fade out animation with default duration 0.2s, can be use for one or more views at once
    class func fadeOut(_ views: [UIView], duration: TimeInterval = 0.2, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            for view in views {
                view.alpha = 0.0
            }
            }, completion: completion)
    }

    /// Fade in animation with default duration 0.2s
    public func fadeIn(duration: TimeInterval = 0.2, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 1
            }, completion: completion)
    }

    /// Fade out animation with default duration 0.2s
    public func fadeOut(duration: TimeInterval = 0.2, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
            }, completion: completion)
    }
    
    /// Spinning animation with speed define by time to spin 1 round
    public func spin(_ timePerRound: TimeInterval) {
        let rotationAnimation: CABasicAnimation
        rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = M_PI * 2.0
        rotationAnimation.duration = timePerRound
        rotationAnimation.isCumulative = true
        rotationAnimation.repeatCount = Float.infinity
        
        self.layer.add(rotationAnimation, forKey: "rotationAnimation")
    }
    
    /// Drawing circle with custom color
    public func drawCircle(_ fillColor: UIColor) {
        let circle = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: 18))
        circle.cornerRadius = circle.width / 2
        circle.clipsToBounds = true
        circle.backgroundColor = fillColor
        circle.center = self.center
        
        self.addSubview(circle)
    }
    
    /// Flipping view
    public func flip(_ frontView: UIView, backView: UIView, isFrontView: Bool) {
        UIView.transition(with: self,
                          duration: 0.5,
                          options: UIViewAnimationOptions.transitionFlipFromLeft,
                          animations: { () -> Void in
                            frontView.isHidden = isFrontView
                            backView.isHidden = !isFrontView
                            
        }, completion: nil)
    }
    
    /// Rotating view with radian
    public func rotate(radians: CGFloat, animated: Bool = false) {
        if animated {
            UIView.animate(withDuration: 0.2, animations: {
                self.transform = CGAffineTransform(rotationAngle: radians)
            })
        } else {
            transform = CGAffineTransform(rotationAngle: radians)
        }
    }
    
    /// Rotating view with degrees
    public func rotate(degrees: CGFloat, animated: Bool = false) {
        if animated {
            UIView.animate(withDuration: 0.2, animations: {
                self.transform = CGAffineTransform(rotationAngle: degrees.toRadians())
            })
        } else {
            transform = CGAffineTransform(rotationAngle: degrees.toRadians())
        }
    }
    
    /// Customize corners with positions and radius
    public func cornerRadius(_ corners: UIRectCorner, radius: CGSize) {
        let maskPath: UIBezierPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: radius)
        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path  = maskPath.cgPath
        self.layer.mask = maskLayer
    }
}

// MARK: Frame extensions
extension UIView {

    /// Make frame become circle if width = height, or oval if width != height
    func roundFrame(_ isWidthPrior: Bool = true) {
        self.cornerRadius = isWidthPrior ? self.width/2 : self.height/2
    }

    /// Shortcut for frame x
    public var x: CGFloat {
        get {
            return self.frame.origin.x
        }

        set {
            self.frame = CGRect(x: newValue, y: self.y, width: self.width, height: self.height)
        }
    }

    /// Shortcut for frame y
    public var y: CGFloat {
        get {
            return self.frame.origin.y
        }

        set {
            self.frame = CGRect(x: self.x, y: newValue, width: self.width, height: self.height)
        }
    }

    /// Shortcut for frame width
    public var width: CGFloat {
        get {
            return self.frame.size.width
        }

        set {
            self.frame = CGRect(x: self.x, y: self.y, width: newValue, height: self.height)
        }
    }

    /// Shortcut for frame height
    public var height: CGFloat {
        get {
            return self.frame.size.height
        }

        set {
            self.frame = CGRect(x: newValue, y: self.y, width: self.width, height: newValue)
        }
    }

    /// Shortcut for frame left
    public var left: CGFloat {
        get {
            return self.x
        }

        set {
            self.x = newValue
        }
    }

    /// Shortcut for frame right
    public var right: CGFloat {
        get {
            return self.x + self.width
        }

        set {
            self.x = newValue - self.width
        }
    }

    /// Shortcut for frame top
    public var top: CGFloat {
        get {
            return self.y
        }

        set {
            self.y = newValue
        }
    }

    /// Shortcut for frame bottom
    public var bottom: CGFloat {
        get {
            return self.y + self.height
        }

        set {
            self.y = newValue - self.height
        }
    }

    /// Shortcut for frame size
    public var size: CGSize {
        get {
            return self.frame.size
        }

        set {
            self.frame = CGRect(x: self.x, y: self.y, width: newValue.width, height: newValue.height)
        }
    }

    /// Shortcut for frame origin
    public var origin: CGPoint {
        get {
            return self.frame.origin
        }

        set {
            self.frame = CGRect(x: newValue.x, y: newValue.y, width: self.width, height: self.height)
        }
    }

    /// Shortcut for center X
    public var centerX: CGFloat {
        get {
            return self.center.x
        }

        set {
            self.center.x = newValue
        }
    }

    /// Shortcut for center Y
    public var centerY: CGFloat {
        get {
            return self.center.y
        }

        set {
            self.center.y = newValue
        }
    }

    /// Shortcut for corner radius
    public var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }

        set {
            self.layer.cornerRadius = newValue
        }
    }

    /// Detect if view is include point
    public func isIncludePoint(_ point: CGPoint) -> Bool {
        if self.left <= point.x && self.right >= point.x && self.top < point.y && self.bottom > point.y {
            return true
        }

        return false
    }
}
