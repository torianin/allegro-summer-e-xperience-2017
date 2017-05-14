//
//  AppDelegate.swift
//  Allegro-Summer
//
//  Created by Robert Ignasiak on 06.05.2017.
//  Copyright © 2017 Torianin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        let menuTabBarController = MenuTabBarController()

        window!.rootViewController = menuTabBarController
        window!.makeKeyAndVisible()
        
        application.statusBarStyle = .lightContent

        return true
    }

}

