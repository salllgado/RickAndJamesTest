//
//  ViewController.swift
//  RickAndJamesTest
//
//  Created by Chrystian on 01/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var viewModel: MainViewModable = MainViewModel()
    private var loadingView: UIActivityIndicatorView?
    
    init(viewModel: MainViewModable = MainViewModel()) {
        self.viewModel = viewModel
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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.viewModel.fetchData()
            let _view = self.view as? MainViewControllerView
            
            _view?.tableView.reloadData()
            self.loadingView?.stopAnimating()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.data > 0 ? 1 : 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return HomeTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(DetailViewController(viewModel: DetailViewModel(customData: 60)), animated: true)
    }
}
