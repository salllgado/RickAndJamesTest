//
//  MainViewModelTests.swift
//  RickAndJamesTestTests
//
//  Created by Chrystian on 01/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import XCTest
@testable import RickAndJamesTest

class MainViewModelTests: XCTestCase {
    
    func testMainViewModelFetchData() {
        
        // Given
        class FakeMainService: MainServiceProvider {
            func getCharacteres(page: Int, completion: @escaping (Result<CharacteresResult, NetworkError>) -> Void) {
                let character = CharacterResult(id: 1, name: "Nome do carinha", status: "Alive", species: "species", gender: "Male", image: "none", location: CharacterLocationResult(name: "Nome"))
                let response = CharacteresResult(info: InfoResult(count: 1, pages: 1, next: nil, prev: nil), character: [character])
                completion(.success(response))
            }
        }
        
        let fakeWorker = FakeMainService()
        let viewModel: (MainViewModable & TableViewPagination) = MainViewModel(service: fakeWorker)
        
        // When
        viewModel.fetchData()
        
        // Then
        XCTAssertTrue(viewModel.characteres.count == 1)
    }
    
    func testMainViewModelPagination() {
        
        // Given
        class FakeMainService: MainServiceProvider {
            func getCharacteres(page: Int, completion: @escaping (Result<CharacteresResult, NetworkError>) -> Void) {
                let jsonFileName = "CharactersListAPIResponse"
                let response = Mockable().mock(type: CharacteresResult.self, jsonFile: jsonFileName)
                
                completion(.success(response))
            }
        }
        
        let fakeWorker = FakeMainService()
        let viewModel: (MainViewModable & TableViewPagination) = MainViewModel(service: fakeWorker)
        
        // When
        viewModel.fetchData()
        viewModel.fetchNextData()
        
        // Then
        XCTAssertTrue(viewModel.currentPage == 2)
        XCTAssertTrue(viewModel.characteres.isEmpty == false, "Have characters data")
        XCTAssertTrue(viewModel.characteres.first?.id != nil, "Character have id")
        
    }
}
