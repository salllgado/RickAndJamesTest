//
//  MainViewControllerLayout.swift
//  RickAndJamesTest
//
//  Created by Chrystian on 05/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

class MainViewControllerLayout: UIView {
    
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
    
    init(delegateDataSouce: UITableViewDataSource & UITableViewDelegate) {
        super.init(frame: .zero)
        
        tableView.delegate = delegateDataSouce
        tableView.dataSource = delegateDataSouce
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func initView() {
        
        addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        tableView.addSubview(refreshControl)
    }
}
