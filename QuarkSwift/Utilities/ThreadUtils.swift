//
//  ThreadUtils.swift
//  QuarkSwift
//
//  Created by Do Duc on 18/10/2016.
//  Copyright © 2016 Do Duc. All rights reserved.
//

import UIKit

/// Executing task in background
public func runInBackGround(task: @escaping (Void) -> Void) {
    DispatchQueue.global(qos: .background).async(execute: task)
}

/// Executing task in main thread
public func runInMainThread(task: @escaping (Void) -> Void) {
    if Thread.isMainThread {
        task()
    } else {
        DispatchQueue.main.async(execute: task)
    }
}
