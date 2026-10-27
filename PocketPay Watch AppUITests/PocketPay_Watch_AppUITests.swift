//
//  PocketPay_Watch_AppUITests.swift
//  PocketPay Watch AppUITests
//
//  Created by Owner on 2026-10-23.
//

import XCTest

final class PocketPay_Watch_AppUITests: XCTestCase {

    // runs before every test. stop right away if something fails
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    // Smoke test: app opens and the main screen shows up
    @MainActor
    func testSmokeAppLaunches() {
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.staticTexts["remainingLabel"].waitForExistence(timeout: 5))
        XCTAssertTrue(app.buttons["addButton"].exists)
    }

    // tapping + should open the category list
    @MainActor
    func testAddButtonOpensCategories() {
        let app = XCUIApplication()
        app.launch()

        app.buttons["addButton"].tap()

        XCTAssertTrue(app.buttons["category_Food"].waitForExistence(timeout: 5))
    }
}
