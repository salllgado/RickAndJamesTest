//
//  MainViewControllerLayout.swift
//  RickAndJamesTest
//
//  Created by Chrystian on 05/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

protocol MainViewControllerLayoutProtocol where Self: UIView {
    func reloadData()
}

typealias TableViewProtocol = (UITableViewDelegate & UITableViewDataSource)

final class MainViewControllerLayout: UIView, MainViewControllerLayoutProtocol {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorColor = .clear
        tableView.backgroundColor = Colors.tableViewBackgroundColor.uiColor
        tableView.rowHeight = 120
        
        return tableView
    }()
    
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .white
        
        return refreshControl
    }()
    
    struct Actions {
        let actionRefreshData: ()->Void
    }
    
    
    private var controller: TableViewProtocol
    private let actions: Actions
    
    init(
        viewController: TableViewProtocol,
        actions: Actions
    ) {
        controller = viewController
        self.actions = actions
        super.init(frame: .zero)
        
        addSubviews()
        constrainViews()
        aditionalConfigurations()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public API
    func reloadData() {
        tableView.reloadData()
        
        if refreshControl.isRefreshing {
            refreshControl.endRefreshing()
        }
    }
    
    private func addSubviews() {
        addSubview(tableView)
        tableView.addSubview(refreshControl)
    }
    
    private func constrainViews() {
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    private func aditionalConfigurations() {
        tableView.delegate = controller
        tableView.dataSource = controller
        
        refreshControl.addTarget(self, action: #selector(actionRefresh), for: .valueChanged)
    }
    
    @objc private func actionRefresh() {
        actions.actionRefreshData()
    }
}
