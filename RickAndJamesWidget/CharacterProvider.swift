//
//  Provider.swift
//  RickAndJamesWidgetExtension
//
//  Created by Chrystian on 19/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import SwiftUI
import WidgetKit

struct CharacterProvider: TimelineProvider {
    typealias Entry = CharacterEntry
    
    func placeholder(in context: Context) -> CharacterEntry {
        let fakeCharacter = CharacterResult(id: 1, name: "Some name", status: "Alive", species: "Human", gender: "Male", image: "none", location: CharacterLocationResult(name: "Earth"))
        return CharacterEntry(date: Date(), character: fakeCharacter)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (CharacterEntry) -> Void) {
        let fakeCharacter = CharacterResult(id: 1, name: "Some name", status: "Alive", species: "Human", gender: "Male", image: "none", location: CharacterLocationResult(name: "Earth"))
        let entry = CharacterEntry(date: Date(), character: fakeCharacter)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let currentDate = Date()
        let refreshData = Calendar.current.date(byAdding: .minute, value: 1, to: currentDate)!
        
        let defaults = UserDefaults(suiteName: "group.rickAndJamesApp")
        
        guard let characterId = defaults?.value(forKey: "lastCharactedId") as? Int  else {
            let character = CharacterResult(id: 1, name: "None", status: "None", species: "None", gender: "None", image: "None", location: CharacterLocationResult(name: "None"))
            let entry = CharacterEntry(date: currentDate, character: character)
            let timeline = Timeline(entries: [entry], policy: .after(refreshData))
            completion(timeline)
            
            return
        }
        
        let service = DetailService()
        service.getCharacter(id: characterId) { (result) in
            let character: CharacterResult
            
            switch result {
            case .success(let characterResult):
                character = characterResult
                break
            case .failure(let error):
                character = CharacterResult(id: 1, name: "None", status: "None", species: "None", gender: "None", image: "None", location: CharacterLocationResult(name: "None"))
                print(error)
            }
            
            let entry = CharacterEntry(date: currentDate, character: character)
            let timeline = Timeline(entries: [entry], policy: .after(refreshData))
            completion(timeline)
        }
    }
}
