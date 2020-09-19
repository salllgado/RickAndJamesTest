//
//  AppDelegate.swift
//  RickAndJamesClip
//
//  Created by Chrystian on 19/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        let window = UIWindow()
        let coordinator = AppClipCoordinator(window: window)
        coordinator.start()
        self.window = window
        
        return true
    }
}

