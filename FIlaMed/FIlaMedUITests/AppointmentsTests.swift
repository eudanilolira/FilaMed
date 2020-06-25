//
//  AppointmentsTests.swift
//  FilaMedUITests
//
//  Created by Danilo Araújo on 25/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import XCTest

class AppointmentsTests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp(){
        self.app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTitle() throws {
        self.app.tabBars.buttons["Consultas"].tap()
        XCTAssert(self.app.staticTexts["Consultas"].isHittable)
   
    }

    func testAccessAppointment() {
        self.app.tabBars.buttons["Consultas"].tap()
        
        let appointmentButton = app.buttons["chevron"].firstMatch
        appointmentButton.tap()
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
