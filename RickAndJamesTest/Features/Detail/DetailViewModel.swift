//
//  DetailViewModel.swift
//  RickAndJamesTest
//
//  Created by Chrystian Salgado on 05/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import Foundation

protocol DetailViewModable: class {
    var data: [String] { get }
    var delegate: DetailViewControllerDelegate? { get set }
    
    func fetchData()
}

protocol DetailViewControllerDelegate: class {
    func reloadUI()
}

class DetailViewModel: DetailViewModable {
    
    private (set) var data: [String] = []
    var delegate: DetailViewControllerDelegate?
    
    func fetchData() {
        data = ["Rick", "Simpsons"]
        
        delegate?.reloadUI()
    }
}
