//
//  AppDelegate.swift
//  RickAndJamesTest
//
//  Created by Chrystian on 01/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let window = UIWindow()
        let coordinator = AppCoordinator(window: window)
        coordinator.start()
        self.window = window
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let queryParams = queryParameters(from: url)
        let id = queryParams.filter { (params) -> Bool in
            params.key == "characterId"
        }.first
        UserDefaults.standard.setValue(Int(id?.value ?? "0"), forKey: "charactedIdToOpenFromWidget")
        let window = UIWindow()
        let coordinator = AppCoordinator(window: window)
        coordinator.start()
        self.window = window
        return true
    }
    
    private func queryParameters(from url: URL) -> [String: String] {
        let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        var queryParams = [String: String]()
        if let _items = urlComponents?.queryItems {
            for queryItem: URLQueryItem in _items {
                if queryItem.value == nil {
                    continue
                }
                queryParams[queryItem.name] = queryItem.value
            }
            return queryParams
        } else {
            return [:]
        }
        
    }
}

