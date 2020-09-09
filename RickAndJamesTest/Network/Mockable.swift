//
//  Mockable.swift
//  RickAndJamesTest
//
//  Created by Chrystian Salgado on 09/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import Foundation

import UIKit

class Mockable {
    func mock<T: Decodable>(type: T.Type, jsonFile: String) -> T {
        if let path = Bundle.main.path(forResource: jsonFile, ofType: "json") {
            do {
                let url = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: url)
                
                let decoder = JSONDecoder()
                let result = try decoder.decode(type.self, from: data)
                
                return result
            } catch {
                debugPrint(error)
            }
        }
        fatalError("Mock file not found")
    }
}

