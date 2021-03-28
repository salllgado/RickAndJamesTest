//
//  MainService.swift
//  RickAndJamesTest
//
//  Created by Chrystian Salgado on 07/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import Foundation

protocol MainServiceProvider: class {
    func getCharacteres(page: Int, completion: @escaping (Result<CharacteresResult, NetworkError>)->Void)
}

class MainService: ServiceProvider, MainServiceProvider {
    
    func getCharacteres(page: Int = 1, completion: @escaping (Result<CharacteresResult, NetworkError>)->Void) {
        if ProcessInfo.processInfo.arguments.contains("MOCK") {
            let jsonFileName = "CharactersListAPIResponse"
            let response = Mockable().mock(type: CharacteresResult.self, jsonFile: jsonFileName)
            completion(.success(response))
        } else {
            request(target: CharacteresAPI.list(page: page), completion: completion)
        }
    }
}
