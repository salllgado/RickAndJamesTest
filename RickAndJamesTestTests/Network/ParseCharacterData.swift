//
//  ParseCharacterData.swift
//  RickAndJamesTestTests
//
//  Created by Chrystian Salgado on 09/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import XCTest
@testable import RickAndJamesTest

class ParseCharacterData: XCTestCase {
    
    func testParseCharacter() {
        
        // Given
        let jsonFileName = "CharacterAPIResponse"
        
        // When
        let response = Mockable().mock(type: CharacterResult.self, jsonFile: jsonFileName)
        
        // Than
        XCTAssertTrue(response.id == 1, "Id Exists")
    }
    
    func parseCharactersData() {
        // Given
        let jsonFileName = "CharactersListAPIResponse"
        
        // When
        let response = Mockable().mock(type: CharacteresResult.self, jsonFile: jsonFileName)
        
        // Than
        XCTAssertFalse(response.character.isEmpty, "Have characters data")
        XCTAssertTrue(response.character.first?.id == 1, "Id Exists")
    }
}
