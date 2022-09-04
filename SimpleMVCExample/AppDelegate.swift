//
//  AppDelegate.swift
//  SimpleMVCExample
//
//  Created by Yury Kudrovsky on 30.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = SomeController()
        window?.makeKeyAndVisible()
        
        return true
    }

}

