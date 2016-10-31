//
//  UserDefault+Extensions.swift
//  whim-ios
//
//  Created by Do Duc on 31/10/2016.
//  Copyright © 2016 maas. All rights reserved.
//

import Foundation

extension UserDefaults {
    public subscript(key: String) -> AnyObject? {
        get {
            return object(forKey: key) as AnyObject?
        }
        
        set {
            set(newValue, forKey: key)
        }
    }
}
