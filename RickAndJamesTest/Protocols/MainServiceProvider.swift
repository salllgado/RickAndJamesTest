//
//  MainServiceProvider.swift
//  RickAndJamesTest
//
//  Created by Chrystian on 19/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import Foundation

protocol MainServiceProvider: class {
    func getCharacteres(page: Int, completion: @escaping (Result<CharacteresResult, NetworkError>)->Void)
}
