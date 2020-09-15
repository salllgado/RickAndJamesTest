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
    
    private (set) var presenter: UINavigationController?
    private (set) var startViewController: UIViewController
    
    private var mainCoordinator: MainCoordinator?
    
    init(window: UIWindow) {
        self.window = window
        
        let _presenter = UINavigationController()
        self.presenter = _presenter
        startViewController = UIViewController()
        mainCoordinator = MainCoordinator(presenter: _presenter)
    }
    
    func start() {
        presenter?.setNavigationTheme()
        window.rootViewController = presenter
        mainCoordinator?.start()
        window.makeKeyAndVisible()
    }
}
