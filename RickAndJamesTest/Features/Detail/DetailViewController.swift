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
        loadingView = self.setLoadingView()
        loadingView?.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.viewModel.fetchData()
        }
    }
}

extension DetailViewController: DetailViewControllerDelegate {
    
    func reloadUI() {
        let _view = view as? DetailViewControllerView
        _view?.tableView.reloadData()
        loadingView?.stopAnimating()
    }
}

extension DetailViewController: TableViewProtocol {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.data.count > 0 ? 1 : 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return DetailTableViewCell(viewModel.data[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let view = UIView()
            view.backgroundColor = .white
            let customView = UIView()
            customView.backgroundColor = .black
            customView.translatesAutoresizingMaskIntoConstraints = false
            customView.layer.cornerRadius = 8
            
            view.addSubview(customView)
            customView.heightAnchor.constraint(equalToConstant: 200).isActive = true
            customView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true
            customView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16).isActive = true
            customView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
            customView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
            
            
            return view
        }
        
        return nil
    }
}
