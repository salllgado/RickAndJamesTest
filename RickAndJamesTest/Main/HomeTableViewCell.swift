//
//  HomeTableViewCell.swift
//  RickAndJamesTest
//
//  Created by Chrystian on 05/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initView() {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        
        addSubview(view)
        view.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        
        let photoView = UIView()
        photoView.translatesAutoresizingMaskIntoConstraints = false
        photoView.backgroundColor = .black
        
        view.addSubview(photoView)
        photoView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        photoView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        photoView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        photoView.widthAnchor.constraint(equalToConstant: frame.width / 3).isActive = true
        
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 16)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .white
        title.numberOfLines = 0
        title.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dapibus auctor tristique. In fermentum, tellus non tempus accumsan, nulla urna varius ligula, et mollis nisl orci et lorem. Nulla consectetur ligula id nisl vestibulum faucibus. Nullam imperdiet, nisl sit amet sagittis fringilla, nisl nibh lobortis nunc, in aliquet tellus ipsum a sem."
        
        view.addSubview(title)
        title.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
        photoView.trailingAnchor.constraint(equalTo: title.leadingAnchor, constant: -16).isActive = true
        title.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
        title.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    }
}
