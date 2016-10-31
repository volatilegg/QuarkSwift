//
//  BundleExtensions.swift
//  QuarkSwift
//
//  Created by Do Duc on 18/10/2016.
//  Copyright © 2016 Do Duc. All rights reserved.
//

import UIKit

extension Bundle {
    static var appVersion: String? {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }

    static var appBuild: String? {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    }
}
