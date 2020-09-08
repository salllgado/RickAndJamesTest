//
//  MainViewControllerLayout.swift
//  RickAndJamesTest
//
//  Created by Chrystian on 05/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

class MainViewControllerLayout: UIView {
    
    private (set) var controller: TableViewProtocol
    
    lazy private (set) var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorColor = .clear
        tableView.backgroundColor = Colors.tableViewBackgroundColor.uiColor
        tableView.rowHeight = 120
        
        return tableView
    }()
    
    lazy private (set) var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .white
        
        return refreshControl
    }()
    
    init(viewController: TableViewProtocol) {
        controller = viewController
        super.init(frame: .zero)
        
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func initView() {
        
        addSubview(tableView)
        
        tableView.delegate = controller
        tableView.dataSource = controller
        
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        tableView.addSubview(refreshControl)
    }
}
