//
//  AppDelegate.swift
//  RickAndJamesTest
//
//  Created by Chrystian on 01/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

typealias TableViewProtocol = UITableViewDataSource & UITableViewDelegate

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        let window = UIWindow()
        let coordinator = AppCoordinator(window: window)
        coordinator.start()
        self.window = window
        
        return true
    }
}

