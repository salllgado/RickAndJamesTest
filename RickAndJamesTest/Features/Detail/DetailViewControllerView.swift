//
//  DetailViewControllerView.swift
//  RickAndJamesTest
//
//  Created by Chrystian Salgado on 05/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

class DetailViewControllerView: UIView {

    private (set) var controller: TableViewProtocol
    
    lazy private (set) var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorColor = .clear
        tableView.backgroundColor = .white
        tableView.estimatedRowHeight = 80
        
        return tableView
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
        backgroundColor = .darkGray
        
        addSubview(tableView)
        
        tableView.delegate = controller
        tableView.dataSource = controller
        
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}
