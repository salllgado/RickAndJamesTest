//
//  AppConfigurations.swift
//  RickAndJamesTest
//
//  Created by Chrystian Salgado on 07/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import Foundation

struct AppConfigurations {
    struct Server {
        static let url = getBundleValue(Keys.config.server.url.rawValue)
        static let key = getBundleValue(Keys.config.server.key.rawValue)
    }
}

extension AppConfigurations {
    
    fileprivate static func getBundleValue(_ key: String) -> String {
        guard let value = Bundle.main.object(forInfoDictionaryKey: key) as? String else { return "" }
        return value
    }
}
