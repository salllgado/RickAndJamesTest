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
    
    private lazy var statusView: UIView = {
        let statusView = UIView()
        statusView.translatesAutoresizingMaskIntoConstraints = false
        statusView.backgroundColor = .white
        
        return statusView
    }()
    
    private lazy var statusDescriptionLabel: UILabel = {
        let statusDescriptionLabel = UILabel()
        statusDescriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        statusDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        statusDescriptionLabel.textColor = .white
        statusDescriptionLabel.numberOfLines = 0
        statusDescriptionLabel.lineBreakMode = .byWordWrapping
        
        
        return statusDescriptionLabel
    }()
    
    private lazy var locationTitle: UILabel = {
        let locationTitle = UILabel()
        locationTitle.translatesAutoresizingMaskIntoConstraints = false
        locationTitle.textColor = .white
        locationTitle.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        return locationTitle
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
        
        // ScrollView setup
        addSubview(scrollView)
        scrollView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = Colors.tableViewBackgroundColor.uiColor
        
        scrollView.addSubview(contentView)
        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        // Image view setup
        contentView.addSubview(imageView)
        imageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        
        // Data content setup
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 8
        
        contentView.addSubview(view)
        view.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        
        view.addSubview(characterNameLabel)
        characterNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true
        characterNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        characterNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        
        // data status
        view.addSubview(statusView)
        let heightValue: CGFloat = 12
        statusView.layer.cornerRadius = heightValue/2
        statusView.heightAnchor.constraint(equalToConstant: heightValue).isActive = true
        statusView.widthAnchor.constraint(equalToConstant: heightValue).isActive = true
        statusView.topAnchor.constraint(equalTo: characterNameLabel.bottomAnchor, constant: 16).isActive = true
        statusView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        
        view.addSubview(statusDescriptionLabel)
        statusDescriptionLabel.topAnchor.constraint(equalTo: characterNameLabel.bottomAnchor, constant: 16).isActive = true
        statusView.trailingAnchor.constraint(equalTo: statusDescriptionLabel.leadingAnchor, constant: -6).isActive = true
        statusDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        statusDescriptionLabel.centerYAnchor.constraint(equalTo: statusView.centerYAnchor).isActive = true
        
        // location
        let locationTitleLabel = UILabel()
        locationTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        locationTitleLabel.textColor = .gray
        locationTitleLabel.text = "Last known location:"
        locationTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        view.addSubview(locationTitleLabel)
        locationTitleLabel.topAnchor.constraint(equalTo: statusView.bottomAnchor, constant: 16).isActive = true
        locationTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        locationTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        
        view.addSubview(locationTitle)
        locationTitle.topAnchor.constraint(equalTo: locationTitleLabel.bottomAnchor, constant: 4).isActive = true
        locationTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        locationTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        locationTitle.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16).isActive = true
    }
    
    func setImage(character: CharacterResult) {
        imageView.cacheImage(urlString: character.image)
        characterNameLabel.text = character.name
        statusView.backgroundColor = character.status == "Alive" ? .green : .gray
        statusDescriptionLabel.text = "\(character.status ) - \(character.species)"
        locationTitle.text = character.location.name
    }
}
