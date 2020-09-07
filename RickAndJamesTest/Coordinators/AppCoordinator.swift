//
//  AppCoordinator.swift
//  RickAndJamesTest
//
//  Created by Chrystian Salgado on 05/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    let window: UIWindow
    
    var startViewController: UIViewController
    var presenter: UINavigationController
    
    private var mainCoordinator: MainCoordinator?
    
    init(window: UIWindow) {
        self.window = window
        presenter = UINavigationController()
        startViewController = UIViewController()
        mainCoordinator = MainCoordinator(presenter: presenter)
    }
    
    func start() {
        window.rootViewController = presenter
        mainCoordinator?.start()
        window.makeKeyAndVisible()
    }
}
