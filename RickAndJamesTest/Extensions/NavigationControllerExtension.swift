//
//  NavigationControllerExtension.swift
//  RickAndJamesTest
//
//  Created by Chrystian on 05/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setLoadingView() -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.color = .black

        let item = UIBarButtonItem(customView: activityIndicatorView)
        self.navigationItem.rightBarButtonItem = item
        
        return activityIndicatorView
    }
}

extension UINavigationController {
    
    func setNavigationTheme() {
        self.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationBar.barTintColor = Colors.tableViewBackgroundColor.uiColor
        self.navigationBar.tintColor = .white
    }
}

