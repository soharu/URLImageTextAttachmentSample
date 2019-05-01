//
//  AppDelegate.swift
//  URLImageTextAttachmentSample
//
//  Created by Jahyun Oh on 01/05/2019.
//  Copyright © 2019 Jahyun Oh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        guard let window = window else { assertionFailure(); return false }
        window.rootViewController = ViewController()
        window.makeKeyAndVisible()
        return true
    }
}
