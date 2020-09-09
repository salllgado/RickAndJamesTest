//
//  RickAndJamesTestUITests.swift
//  RickAndJamesTestUITests
//
//  Created by Chrystian on 01/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import XCTest

class RickAndJamesTestUITests: XCTestCase {

    func testExample() {
        
        let app = XCUIApplication()
        app.launchArguments.append("MOCK")
        app.launch()

        sleep(1)
        app.tables.firstMatch.swipeUp()
        app.tables.cells.containing(.staticText, identifier: "Alan Rails").element.tap()
        XCTAssertTrue(app.navigationBars["Alan Rails"].exists)
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
        XCTAssertTrue(app.tables.firstMatch.exists)
        
        app.tables.firstMatch.swipeDown()
        app.tables.cells.containing(.staticText, identifier: "Morty Smith").element.tap()
        XCTAssertTrue(app.navigationBars["Morty Smith"].exists)
        
        XCTAssertTrue(app.staticTexts.containing(.staticText, identifier: "Alive - Human").element.exists)
        XCTAssertTrue(app.staticTexts.containing(.staticText, identifier: "Last known location:").element.exists)
        XCTAssertTrue(app.staticTexts.containing(.staticText, identifier: "Earth (Replacement Dimension)").element.exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
