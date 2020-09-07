//
//  DetailViewController.swift
//  RickAndJamesTest
//
//  Created by Chrystian on 05/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    private var loadingView: UIActivityIndicatorView?
    private var viewModel: DetailViewModable
    
    init(viewModel: DetailViewModable) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = DetailViewControllerView(viewController: self)
        viewModel.fetchData()
    }
}

extension DetailViewController: DetailViewControllerDelegate {
    
    func reloadUI() {
        let _view = view as? DetailViewControllerView
        _view?.setImage(character: viewModel.character)
        title = viewModel.character.name
    }
}
