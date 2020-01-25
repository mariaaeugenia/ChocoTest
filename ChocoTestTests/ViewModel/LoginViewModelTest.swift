//
//  LoginViewModelTest.swift
//  ChocoTestTests
//
//  Created by Maria Eugênia Pereira Teixeira on 25/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import XCTest
@testable import ChocoTest

class LoginViewModelTest: XCTestCase {
    
    let sut = LoginViewModel()

    override func setUp() {
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_button_enabled() {
        sut.email = "email"
        sut.password = "pws"
        XCTAssertEqual(true, sut.buttonEnabled())
        
        sut.email = ""
        sut.password = "pws"
        XCTAssertEqual(false, sut.buttonEnabled())
        
        sut.email = "email"
        sut.password = ""
        XCTAssertEqual(false, sut.buttonEnabled())
        
        sut.email = ""
        sut.password = ""
        XCTAssertEqual(false, sut.buttonEnabled())
    }

}
