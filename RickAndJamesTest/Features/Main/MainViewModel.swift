//
//  MainViewModel.swift
//  RickAndJamesTest
//
//  Created by Chrystian on 05/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import Foundation

protocol MainViewModable: class {
    var characteres: [CharacterResult] { get }
    var nextPage: Bool { get }
    var shouldShowLoadingCell: Bool { get }
    
    var delegate: MainViewControllerDelegate? { get set }
    
    func fetchData()
    func refreshData()
}

protocol MainViewControllerDelegate: class {
    func reloadUI()
}

class MainViewModel: MainViewModable, TableViewPagination {
    
    var characteres: [CharacterResult] = []
    var nextPage: Bool = false
    var shouldShowLoadingCell: Bool = true
    var currentPage: Int = 1
    var numberOfPages: Int = 1
    
    var delegate: MainViewControllerDelegate?
    private var service: MainServiceProvider
    
    init(service: MainServiceProvider = MainService()) {
        self.service = service
    }
    
    func fetchData() {
        service.getCharacteres(page: currentPage) { [ weak self ] (result) in
            switch result {
            case .success(let successResult):
                debugPrint(successResult)
                self?.characteres = successResult.character
                self?.nextPage = (successResult.info.next != nil) && successResult.info.count > successResult.character.count ? true : false
                self?.shouldShowLoadingCell = successResult.character.count < successResult.info.count
                self?.numberOfPages = successResult.info.count
                
                DispatchQueue.main.async {
                    self?.delegate?.reloadUI()
                }
            case .failure(let err):
                debugPrint(err)
            }
        }
    }
    
    func refreshData() {
        currentPage = 1
        fetchData()
    }
    
    func fetchNextData() {
        currentPage += 1
        
        service.getCharacteres(page: currentPage) { [ weak self ] (result) in
            switch result {
            case .success(let successResult):
                debugPrint(successResult)
                self?.characteres += successResult.character
                self?.nextPage = (successResult.info.next != nil) && successResult.info.count > successResult.character.count ? true : false
                self?.shouldShowLoadingCell = successResult.character.count < successResult.info.count
                self?.numberOfPages = successResult.info.count
                
                DispatchQueue.main.async {
                    self?.delegate?.reloadUI()
                }
            case .failure(let err):
                debugPrint(err)
            }
        }
    }
}
