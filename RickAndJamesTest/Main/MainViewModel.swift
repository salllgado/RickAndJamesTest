//
//  MainViewModel.swift
//  RickAndJamesTest
//
//  Created by Chrystian on 05/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import Foundation

protocol MainViewModable: class {
    var data: Int { get }
    
    func fetchData()
}

class MainViewModel: MainViewModable {
    
    var data: Int
    
    init() {
        data = 0
    }
    
    func fetchData() {
        data = 10
    }
}
