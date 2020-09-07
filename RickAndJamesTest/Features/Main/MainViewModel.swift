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
    var delegate: MainViewControllerDelegate? { get set }
    
    func fetchData()
}

protocol MainViewControllerDelegate: class {
    func reloadUI()
}

class MainViewModel: MainViewModable {
    
    var characteres: [CharacterResult] = []
    var delegate: MainViewControllerDelegate?
    private lazy var service: MainService = MainService()
    
    func fetchData() {
        service.getCharacteres { [ unowned self ] (result) in
            switch result {
            case .success(let successResult):
                debugPrint(successResult)
                self.characteres = successResult.character
                
                DispatchQueue.main.async {
                    self.delegate?.reloadUI()
                }
            case .failure(let err):
                debugPrint(err)
            }
        }
    }
}
