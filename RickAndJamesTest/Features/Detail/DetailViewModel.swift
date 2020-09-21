//
//  DetailViewModel.swift
//  RickAndJamesTest
//
//  Created by Chrystian Salgado on 05/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import Foundation
import WidgetKit

protocol DetailViewModable: class {
    var character: CharacterResult { get }
    var delegate: DetailViewControllerDelegate? { get set }
    
    func fetchData()
}

protocol DetailViewControllerDelegate: class {
    func reloadUI()
}

class DetailViewModel: DetailViewModable {
    
    private (set) var character: CharacterResult
    var delegate: DetailViewControllerDelegate?
    
    init(character: CharacterResult) {
        self.character = character
    }
    
    func fetchData() {
        delegate?.reloadUI()
        
        let defaults = UserDefaults(suiteName: "group.rickAndJamesApp")
        defaults?.setValue(character.id, forKey: "lastCharactedId")
        
        print("Value saved")
        
        if #available(iOS 14.0, *) {
            WidgetCenter.shared.reloadAllTimelines()
        }
    }
}
