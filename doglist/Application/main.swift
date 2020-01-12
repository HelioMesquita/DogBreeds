//
//  main.swift
//  doglist
//
//  Created by Hélio Mesquita on 11/01/20.
//  Copyright © 2020 Hélio Mesquita. All rights reserved.
//

import Foundation
import UIKit

final class MockAppDelegate: UIResponder, UIApplicationDelegate {}

private func appDelegateClassName() -> String {
    let isTesting = NSClassFromString("XCTestCase") != nil
    return NSStringFromClass(isTesting ? MockAppDelegate.self : AppDelegate.self)
}

_ = UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, NSStringFromClass(UIApplication.self), appDelegateClassName())

