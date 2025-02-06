//
//  HW3UITests.swift
//  HW3UITests
//
//  Created by Rohan Panchal on 1/22/24.
//

import XCTest

final class HW3UITests: XCTestCase {

    // 1.A All elements exist and are reachable from the tests.
    // NOTE: Try and get this working first.
    // Points: 20
    func testAllElementsExist() {
        
        let app = XCUIApplication()
        app.launch()
        
        createScreenshotAndAttach()
        
                XCTAssertTrue(app.buttons["0"].exists)
        XCTAssertTrue(app.buttons["1"].exists)
        XCTAssertTrue(app.buttons["2"].exists)
                XCTAssertTrue(app.buttons["3"].exists)
        XCTAssertTrue(app.buttons["4"].exists)
        XCTAssertTrue(app.buttons["5"].exists)
        XCTAssertTrue(app.buttons["6"].exists)
        XCTAssertTrue(app.buttons["7"].exists)
        XCTAssertTrue(app.buttons["8"].exists)
        XCTAssertTrue(app.buttons["9"].exists)
        
        XCTAssertTrue(app.buttons["+"].exists)
        XCTAssertTrue(app.buttons["="].exists)
        XCTAssertTrue(app.buttons["Clear"].exists)
    
        XCTAssertTrue(app.staticTexts["Result"].exists)
        XCTAssertTrue(app.staticTexts["Result"].label == "0")
    }
    
    // 1.B Number input
    // Points: 10
    func testTappingEachNumeralElementChangesTheResultLabel() {
        
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["9"].tap()
        app.buttons["8"].tap()
        app.buttons["7"].tap()
        app.buttons["6"].tap()
        app.buttons["5"].tap()
        app.buttons["4"].tap()
        app.buttons["3"].tap()
        app.buttons["2"].tap()
        app.buttons["1"].tap()
        app.buttons["0"].tap()
        
        createScreenshotAndAttach()
        
        XCTAssertEqual(app.staticTexts["Result"].label, "9876543210")
    }
    
    // 1.C Clear button after number input
    // Points: 10
    func testTappingEachNumeralElementChangesTheResultLabelAndTappingClearResultsInDefaultValueOf0() {
        
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["9"].tap()
        app.buttons["8"].tap()
        app.buttons["7"].tap()
        app.buttons["6"].tap()
        app.buttons["5"].tap()
        app.buttons["4"].tap()
        app.buttons["3"].tap()
        app.buttons["2"].tap()
        app.buttons["1"].tap()
        app.buttons["0"].tap()
        
        createScreenshotAndAttach()
        
        app.buttons["Clear"].tap()
        
        XCTAssertEqual(app.staticTexts["Result"].label, "0")
    }
    
    // 1.D
    // NOTE: 15 + 17 = 32
    // Points: 10
    func testBasicAddOperation() {
        
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["1"].tap()
        app.buttons["5"].tap()
        
        createScreenshotAndAttach()
        
        app.buttons["+"].tap()
        
        app.buttons["1"].tap()
        app.buttons["7"].tap()
        
        createScreenshotAndAttach()
        
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["Result"].label, "32")
        
        createScreenshotAndAttach()

        app.buttons["Clear"].tap()
        
        XCTAssertEqual(app.staticTexts["Result"].label, "0")
        
        createScreenshotAndAttach()
    }
    
    // 1.E
    // NOTE: 0 + 17 = 17
    // Points: 10
    func testBasicAddOperation2() {
        
        let app = XCUIApplication()
        app.launch()
        
        createScreenshotAndAttach()
        
        app.buttons["+"].tap()
        
        app.buttons["1"].tap()
        app.buttons["7"].tap()
        
        createScreenshotAndAttach()
        
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["Result"].label, "17")
        
        createScreenshotAndAttach()

        app.buttons["Clear"].tap()
        
        XCTAssertEqual(app.staticTexts["Result"].label, "0")
        
        createScreenshotAndAttach()
    }
    
    // 1.F
    // NOTE: 15 + 0 = 15
    // Points: 10
    func testBasicAddOperation3() {
        
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["1"].tap()
        app.buttons["5"].tap()
        
        createScreenshotAndAttach()
        
        app.buttons["+"].tap()

        createScreenshotAndAttach()
        
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["Result"].label, "15")
        
        createScreenshotAndAttach()

        app.buttons["Clear"].tap()
        
        XCTAssertEqual(app.staticTexts["Result"].label, "0")
        
        createScreenshotAndAttach()
    }
    
    // 1.G
    // NOTE: 15 + 1 + 2 = 18
    // Points: 10
    func testBasicAddOperation4() {
        
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["1"].tap()
        app.buttons["5"].tap()
        
        createScreenshotAndAttach()
        
        app.buttons["+"].tap()
        
        app.buttons["1"].tap()
        
        createScreenshotAndAttach()
        
        app.buttons["+"].tap()
        
        app.buttons["2"].tap()
        
        createScreenshotAndAttach()
        
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["Result"].label, "18")
        
        createScreenshotAndAttach()

        app.buttons["Clear"].tap()
        
        XCTAssertEqual(app.staticTexts["Result"].label, "0")
        
        createScreenshotAndAttach()
    }
    
    // 1.H
    // NOTE: 1 + 1 = 2 = 3
    // Points: 10
    func testBasicAddOperation5() {
        
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["1"].tap()
        
        createScreenshotAndAttach()
        
        app.buttons["+"].tap()
        
        app.buttons["1"].tap()
        
        createScreenshotAndAttach()
        
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["Result"].label, "2")
        
        createScreenshotAndAttach()
        
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["Result"].label, "3")
        
        createScreenshotAndAttach()

        app.buttons["Clear"].tap()
        
        XCTAssertEqual(app.staticTexts["Result"].label, "0")
        
        createScreenshotAndAttach()
    }
    
    // 1.I
    // NOTE: 1 + 1 = 2 [CLEAR] + 15 = 15 [CLEAR] 0
    // Points: 10
    func testWildcardMath() {
        
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["1"].tap()
        
        createScreenshotAndAttach()
        
        app.buttons["+"].tap()
        
        app.buttons["1"].tap()
        
        createScreenshotAndAttach()
        
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["Result"].label, "2")

        createScreenshotAndAttach()
        
        app.buttons["Clear"].tap()
        
        createScreenshotAndAttach()
        
        app.buttons["+"].tap()
        
        app.buttons["1"].tap()
        
        app.buttons["5"].tap()
        
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["Result"].label, "15")
        
        createScreenshotAndAttach()

        app.buttons["Clear"].tap()
        
        XCTAssertEqual(app.staticTexts["Result"].label, "0")
        
        createScreenshotAndAttach()
    }
    
    private func createScreenshotAndAttach() {
        
        let mainScreenScreenshot = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: mainScreenScreenshot)
        attachment.lifetime = .keepAlways
        add(attachment)
        
    }

}

