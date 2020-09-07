//
//  MainTableViewCell.swift
//  RickAndJamesTest
//
//  Created by Chrystian on 05/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    var character: CharacterResult?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initView()
    }
    
    init(character: CharacterResult) {
        self.character = character
        super.init(style: .default, reuseIdentifier: nil)
        
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initView() {
        backgroundColor = Colors.tableViewBackgroundColor.uiColor
        
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
        
        view.addSubview(photoView)
        photoView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        photoView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        photoView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        photoView.widthAnchor.constraint(equalToConstant: frame.width / 3).isActive = true
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.cacheImage(urlString: character?.image ?? "")
        
        photoView.addSubview(imageView)
        
        photoView.topAnchor.constraint(equalTo: imageView.topAnchor).isActive = true
        photoView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
        photoView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        photoView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 16, weight: .black)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .white
        title.numberOfLines = 0
        title.text = character?.name
        
        view.addSubview(title)
        title.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
        photoView.trailingAnchor.constraint(equalTo: title.leadingAnchor, constant: -16).isActive = true
        title.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        let statusView = UIView()
        statusView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(statusView)
        
        statusView.backgroundColor = character?.status == "Alive" ? .green : .gray
        statusView.layer.cornerRadius = 8/2
        
        statusView.heightAnchor.constraint(equalToConstant: 8).isActive = true
        statusView.widthAnchor.constraint(equalToConstant: 8).isActive = true
        photoView.trailingAnchor.constraint(equalTo: statusView.leadingAnchor, constant: -16).isActive = true
                
        let subtitle = UILabel()
        subtitle.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.textColor = .white
        subtitle.numberOfLines = 0
        subtitle.lineBreakMode = .byWordWrapping
        subtitle.text = "\(character?.status ?? "") - \(character?.species ?? "")"
        
        view.addSubview(subtitle)
        subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 4).isActive = true
        statusView.trailingAnchor.constraint(equalTo: subtitle.leadingAnchor, constant: -6).isActive = true
        subtitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        subtitle.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -4).isActive = true
        statusView.centerYAnchor.constraint(equalTo: subtitle.centerYAnchor).isActive = true
    }
}
