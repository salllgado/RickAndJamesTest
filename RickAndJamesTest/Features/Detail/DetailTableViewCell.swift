//
//  DetailTableViewCell.swift
//  RickAndJamesTest
//
//  Created by Chrystian Salgado on 05/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    private var data: String?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initView()
    }
    
    init(_ data: String) {
        self.data = data
        super.init(style: .default, reuseIdentifier: nil)
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initView() {
        let separatorView = UIView()
        separatorView.backgroundColor = .darkGray
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = data ?? "No name"
        label.textColor = .black
        
        addSubview(label)
        
        label.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        addSubview(separatorView)
        
        separatorView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        separatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        separatorView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
