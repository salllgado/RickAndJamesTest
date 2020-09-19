//
//  AppClipCoordinator.swift
//  RickAndJamesClip
//
//  Created by Chrystian on 19/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

class AppClipCoordinator: Coordinator {
    
    let window: UIWindow
    
    private (set) var presenter: UINavigationController?
    private (set) var startViewController: UIViewController
    
    private var mainCoordinator: DetailCoordinator?
    
    init(window: UIWindow) {
        self.window = window
        
        let _presenter = UINavigationController()
        self.presenter = _presenter
        startViewController = UIViewController()
        mainCoordinator = DetailCoordinator(presenter: _presenter, viewModel: DetailViewModel(character: CharacterResult(id: 1, name: "Some", status: "Alive", species: "Human", gender: "Male", image: "none", location: CharacterLocationResult(name: "Alabama"))))
    }
    
    func start() {
        window.rootViewController = presenter
        mainCoordinator?.start()
        window.makeKeyAndVisible()
    }
}
