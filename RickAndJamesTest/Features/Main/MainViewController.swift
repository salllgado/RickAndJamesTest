//
//  ViewController.swift
//  RickAndJamesTest
//
//  Created by Chrystian on 01/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    
    private lazy var loadingView: UIActivityIndicatorView = {
        self.setLoadingView()
    }()
    
    private let viewModel: (MainViewModable & TableViewPagination)
    private let navigationDelegate: MainNavigationDelegate?
    
    init(
        viewModel: (MainViewModable & TableViewPagination) = MainViewModel(),
        navigationDelegate: MainNavigationDelegate?
    ) {
        self.viewModel = viewModel
        self.navigationDelegate = navigationDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        setupNavigationBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "The rick and morty api"
        
        let layout = MainViewControllerLayout(
            viewController: self,
            actions: .init(actionRefreshData: actionRefreshData)
        )

        UITableView.shouldShowLoadingCell = viewModel.shouldShowLoadingCell
        view = layout
        
        loadingView.startAnimating()
        viewModel.fetchData()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.kern: 0.0,
            NSAttributedString.Key.foregroundColor: Colors.navBarTitleColor.uiColor,
        ]
    }
    
    // MARK: - Actions
    func actionRefreshData() {
        self.viewModel.refreshData()
    }
    
    @objc private func refreshData(_ refreshControl: UIRefreshControl) {
        viewModel.refreshData()
    }
}

extension MainViewController: MainViewControllerDelegate {
    
    func reloadUI() {
        guard let layout = self.view as? MainViewControllerLayoutProtocol else { return }
        layout.reloadData()
        loadingView.stopAnimating()
    }
    
    func navigateToDetail(_ character: CharacterResult) {
        navigationDelegate?.navigateToDetail(character: character)
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
        navigateToDetail(viewModel.characteres[indexPath.row])
    }
}
