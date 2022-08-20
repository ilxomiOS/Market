//
//  AppDelegate.swift
//  Online Market 4
//
//  Created by Ilxom on 17/08/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = SigninViewController()
        window?.makeKeyAndVisible()
        return true
    }

}

