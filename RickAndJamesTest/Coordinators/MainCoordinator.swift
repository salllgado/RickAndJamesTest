//
//  MainCoordinator.swift
//  RickAndJamesTest
//
//  Created by Chrystian Salgado on 05/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

protocol MainNavigationDelegate: Any {
    func navigateToDetail()
}

class MainCoordinator: Coordinator {
    
    var presenter: UINavigationController
    var startViewController: UIViewController = UIViewController()
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        presenter.navigationItem.backBarButtonItem?.title = nil
        let viewModel = MainViewModel()
        let viewController = MainViewController(viewModel: viewModel, navigationDelegate: self)
        viewModel.delegate = viewController
        
        startViewController = viewController
        presenter.pushViewController(startViewController, animated: true)
    }
}

extension MainCoordinator: MainNavigationDelegate {
    
    func navigateToDetail() {
        let viewModel = DetailViewModel()
        let controller = DetailViewController(viewModel: viewModel)
        viewModel.delegate = controller
        presenter.pushViewController(controller, animated: true)
    }
}
