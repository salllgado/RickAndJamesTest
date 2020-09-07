//
//  DetailViewControllerView.swift
//  RickAndJamesTest
//
//  Created by Chrystian Salgado on 05/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

class DetailViewControllerView: UIView {
    
    private (set) var controller: UIViewController
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = Colors.tableViewBackgroundColor.uiColor
        
        return scrollView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private lazy var characterNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        
        return label
    }()
    
    init(viewController: UIViewController) {
        controller = viewController
        super.init(frame: .zero)
        
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func initView() {
        backgroundColor = Colors.tableViewBackgroundColor.uiColor
        
        addSubview(scrollView)
        scrollView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        
        scrollView.addSubview(contentView)
        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        contentView.addSubview(imageView)
        imageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.tableViewBackgroundColor.uiColor
        view.layer.cornerRadius = 8
        
        contentView.addSubview(view)
        view.heightAnchor.constraint(equalToConstant: 1300).isActive = true
        view.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        
        view.addSubview(characterNameLabel)
        characterNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
        characterNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        characterNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
    }
    
    func setImage(character: CharacterResult) {
        imageView.cacheImage(urlString: character.image)
        characterNameLabel.text = character.name
    }
}
