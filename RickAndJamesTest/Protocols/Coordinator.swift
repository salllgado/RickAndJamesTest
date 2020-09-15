//
//  Coordinator.swift
//  RickAndJamesTest
//
//  Created by Chrystian Salgado on 05/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

protocol Coordinator {
    var presenter: UINavigationController? { get }
    var startViewController: UIViewController { get }
    
    func start()
}
