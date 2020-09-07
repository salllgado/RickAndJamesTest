//
//  ViewController.swift
//  RickAndJamesTest
//
//  Created by Chrystian on 01/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private var viewModel: MainViewModable = MainViewModel()
    private var navigationDelegate: MainNavigationDelegate?
    
    private var loadingView: UIActivityIndicatorView?
    
    init(viewModel: MainViewModable = MainViewModel(), navigationDelegate: MainNavigationDelegate?) {
        self.viewModel = viewModel
        self.navigationDelegate = navigationDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "The rick and morty api"
        view = MainViewControllerView(viewController: self)
        
        loadingView = self.setLoadingView()
        loadingView?.startAnimating()
        
        viewModel.fetchData()
    }
}

extension MainViewController: MainViewControllerDelegate {
    func reloadUI() {
        let _view = self.view as? MainViewControllerView
        _view?.tableView.reloadData()
        
        self.loadingView?.stopAnimating()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.characteres.count > 0 ? 1 : 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characteres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return MainTableViewCell(character: viewModel.characteres[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigationDelegate?.navigateToDetail(character: viewModel.characteres[indexPath.row])
    }
}
