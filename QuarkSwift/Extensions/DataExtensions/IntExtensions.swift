//
//  IntExtensions.swift
//  QuarkSwift
//
//  Created by Do Duc on 18/10/2016.
//  Copyright © 2016 Do Duc. All rights reserved.
//

import Foundation

extension Int {
    static func random(from: Int, to: Int) -> Int? {
        guard to > from else {
            return nil
        }

        return Int(arc4random_uniform(UInt32(to - from + 1))) + from
    }
}
