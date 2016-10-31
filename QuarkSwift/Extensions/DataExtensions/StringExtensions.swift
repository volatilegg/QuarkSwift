//
//  StringExtensions.swift
//  QuarkSwift
//
//  Created by Do Duc on 18/10/2016.
//  Copyright © 2016 Do Duc. All rights reserved.
//

import Foundation
import MapKit

extension String {
    /// Double value from string, if posible
    public var doubleValue: Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }

    /// Latitude and Longitude value of string
    public var coordinateValue: CLLocationCoordinate2D? {
        let array = self.characters.split { $0 == "," }.map(String.init)

        if let latValue = Double(array[0]), let lonValue = Double(array[1]) {
            return CLLocationCoordinate2D(latitude: latValue, longitude: lonValue)
        }

        return nil
    }

    /// Length of string
    public var length: Int {
        return self.characters.count
    }

    /// Cut string with a start index, length default = 1
    public func substring(startIndex: Int, length: Int = 0) -> String {
        let start = self.characters.index(self.startIndex, offsetBy: startIndex + length)
        return self[start..<self.endIndex]
    }
    
    /// Return a coordinate string with format "lat,lon"
    static func coordinateToString(_ lat: Double, lon: Double) -> String {
        return "\(lat),\(lon)"
    }
}
