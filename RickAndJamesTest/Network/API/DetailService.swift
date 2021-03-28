//
//  DetailService.swift
//  RickAndJamesTest
//
//  Created by Chrystian on 21/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import Foundation

protocol DetailServiceProvider: class {
    func getCharacter(id: Int, completion: @escaping (Result<CharacterResult, NetworkError>)->Void)
}

class DetailService: ServiceProvider, DetailServiceProvider {
    func getCharacter(id: Int, completion: @escaping (Result<CharacterResult, NetworkError>)->Void) {
        request(target: CharacteresAPI.character(id: id), completion: completion)
    }
}
