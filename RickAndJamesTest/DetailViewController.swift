//
//  DetailViewController.swift
//  RickAndJamesTest
//
//  Created by Chrystian on 05/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

protocol DetailViewModable: class {
    var data: Int { get }
    
    func fetchData()
}

class DetailViewModel: DetailViewModable {
    var data: Int
    
    init(customData: Int = 0) {
        data = customData
    }
    
    func fetchData() {
        data = data * 2
    }
}

class DetailViewController: UITableViewController {
    
    private var loadingView: UIActivityIndicatorView?
    private var viewModel: DetailViewModable = DetailViewModel()
    
    init(viewModel: DetailViewModable = DetailViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = String(tableView.numberOfRows(inSection: 0))
        loadingView = self.setLoadingView()
        loadingView?.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.viewModel.fetchData()
            self.tableView.reloadData()
            self.loadingView?.stopAnimating()
            self.title = String(self.tableView.numberOfRows(inSection: 0))
        }
    }
}

extension DetailViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.data > 0 ? 1 : 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return HomeTableViewCell()
    }
}
