//
//  ViewController.swift
//  RickAndJamesTest
//
//  Created by Chrystian on 01/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private var viewModel: (MainViewModable & TableViewPagination) = MainViewModel()
    private var navigationDelegate: MainNavigationDelegate?
    
    private var loadingView: UIActivityIndicatorView?
    
    init(viewModel: (MainViewModable & TableViewPagination) = MainViewModel(), navigationDelegate: MainNavigationDelegate?) {
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
        
        let layout = MainViewControllerLayout(delegateDataSouce: self)
        layout.refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        
        UITableView.shouldShowLoadingCell = viewModel.shouldShowLoadingCell
        view = layout
        
        loadingView = self.setLoadingView()
        loadingView?.startAnimating()
        
        viewModel.fetchData()
    }
    
    @objc private func refreshData(_ refreshControl: UIRefreshControl) {
        viewModel.refreshData()
    }
}

extension MainViewController: MainViewControllerDelegate {
    
    func reloadUI() {
        let layout = self.view as? MainViewControllerLayout
        layout?.tableView.reloadData()
        
        if layout?.refreshControl.isRefreshing ?? false { layout?.refreshControl.endRefreshing() }
        
        self.loadingView?.stopAnimating()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.characteres.count > 0 ? 1 : 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UITableView.shouldShowLoadingCell ? viewModel.characteres.count + 1 : viewModel.characteres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = viewModel.canSetLoading(when: indexPath, reach: viewModel.characteres.count, default: MainTableViewCell())
        
        if let mainTableViewCell = cell as? MainTableViewCell {
            mainTableViewCell.displayUI(character: viewModel.characteres[indexPath.row])
        }
        
        return cell
    }
}

extension MainViewController {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard viewModel.isLoadingIndexPath(indexPath, reach: viewModel.characteres.count) else { return }
        viewModel.fetchNextData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigationDelegate?.navigateToDetail(character: viewModel.characteres[indexPath.row])
    }
}
