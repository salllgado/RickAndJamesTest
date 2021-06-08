//
//  LoadingTableViewCell.swift
//  RickAndJamesTest
//
//  Created by Chrystian Salgado on 08/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

final class LoadingTableViewCell: UITableViewCell {
    
    lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.color = UIColor.white
        indicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        indicator.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        return indicator
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    private func setupSubviews() {
        addSubview(indicator)
        backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            indicator.topAnchor.constraint(lessThanOrEqualTo: self.topAnchor, constant: 16),
            indicator.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -16),
            indicator.leadingAnchor.constraint(lessThanOrEqualTo: self.leadingAnchor, constant: 4),
            indicator.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -4),
            indicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        indicator.startAnimating()
    }
    
    override public func prepareForReuse() {
        indicator.stopAnimating()
        indicator.removeFromSuperview()
    }
}
