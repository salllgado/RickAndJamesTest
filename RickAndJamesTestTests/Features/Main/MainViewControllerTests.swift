//
//  MainViewControllerTests.swift
//  RickAndJamesTestTests
//
//  Created by C. Salgado on 28/03/21.
//  Copyright © 2021 Salgado Solutions. All rights reserved.
//

import XCTest
@testable import RickAndJamesTest

final class MainViewControllerTests: XCTestCase {

    func test_whenViewDidLoad_viewModelShouldFetchData() {
        // Given
        let navigationDelegateSpy: MainNavigationDelegate = MainNavigationDelegateSpy()
        let viewModelSpy = MainViewModelSut()
        let sut = MainViewController(viewModel: viewModelSpy, navigationDelegate: navigationDelegateSpy)
        
        // When
        _ = sut.view
        
        // Than
        XCTAssertEqual(viewModelSpy.fetchDataCalledCount, 1)
    }
    
    func test_whenRefreshDataAction_viewModelShouldRefreshData() {
        // Given
        let navigationDelegateSpy: MainNavigationDelegate = MainNavigationDelegateSpy()
        let viewModelSpy = MainViewModelSut()
        let sut = MainViewController(viewModel: viewModelSpy, navigationDelegate: navigationDelegateSpy)
        
        // When
        _ = sut.view
        sut.actionRefreshData()
        
        // Than
        XCTAssertEqual(viewModelSpy.refreshDataCalledCount, 1)
    }
    
    func test_whenReloadUI_viewLayoutShouldReloadData() {
        // Given
        let viewLayoutSut = MainViewSut()
        let navigationDelegateSpy: MainNavigationDelegate = MainNavigationDelegateSpy()
        let viewModelSpy = MainViewModelSut()
        let sut = MainViewController(viewModel: viewModelSpy, navigationDelegate: navigationDelegateSpy)
        
        // When
        _ = sut.view
        sut.view = viewLayoutSut
        sut.reloadUI()
        
        // Than
        XCTAssertEqual(viewLayoutSut.reloadDataCalledCount, 1)
    }
    
    func test_onNavigateToDetail_navigationDelegateShouldNavigateToDetail() {
        // Given
        let characterMock: CharacterResult = .fixture()
        let navigationDelegateSpy = MainNavigationDelegateSpy()
        let sut = MainViewController(viewModel: MainViewModelSut(), navigationDelegate: navigationDelegateSpy)
        
        // When
        _ = sut.view
        sut.navigateToDetail(characterMock)
        
        // Than
        XCTAssertTrue(navigationDelegateSpy.navigateToDetailCalled)
        XCTAssertEqual(navigationDelegateSpy.navigateToDetailPassed, characterMock)
    }
}

final class MainViewSut: UIView, MainViewControllerLayoutProtocol {
    private(set) var reloadDataCalledCount: Int = 0
    func reloadData() {
        reloadDataCalledCount += 1
    }
}

final class MainViewModelSut: MainViewModable, TableViewPagination {
    var characteres: [CharacterResult] = []
    var nextPage: Bool = false
    var shouldShowLoadingCell: Bool = false
    var delegate: MainViewControllerDelegate?
    var currentPage: Int = 0
    var numberOfPages: Int = 0
    
    private(set) var fetchDataCalledCount: Int = 0
    func fetchData() {
        fetchDataCalledCount += 1
    }
    
    private(set) var refreshDataCalledCount: Int = 0
    func refreshData() {
        refreshDataCalledCount += 1
    }
    
    private(set) var fetchNextDataCalledCount: Int = 0
    func fetchNextData() {
        fetchDataCalledCount += 1
    }
}

final class MainNavigationDelegateSpy: MainNavigationDelegate {
    private(set) var navigateToDetailCalled = false
    private(set) var navigateToDetailPassed: CharacterResult?
    func navigateToDetail(character: CharacterResult) {
        navigateToDetailCalled = true
        navigateToDetailPassed = character
    }
}

extension CharacterResult: Equatable {
    
    public static func ==(lhs: CharacterResult, rhs: CharacterResult) -> Bool{
        lhs.id == rhs.id
            && lhs.name == rhs.name
            && lhs.image == rhs.image
            && lhs.species == rhs.species
    }
}
