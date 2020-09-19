//
//  DetailCoordinator.swift
//  RickAndJamesTest
//
//  Created by Chrystian on 19/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

final class DetailCoordinator: Coordinator {
    
    private (set) weak var presenter: UINavigationController?
    private (set) var startViewController: UIViewController = UIViewController()
    private (set) var viewModel: DetailViewModel
    
    init(presenter: UINavigationController, viewModel: DetailViewModel) {
        self.presenter = presenter
        self.viewModel = viewModel
    }
    
    func start() {
        let viewController = DetailViewController(viewModel: viewModel)
        viewModel.delegate = viewController
        
        startViewController = viewController
        presenter?.pushViewController(startViewController, animated: true)
    }
}
