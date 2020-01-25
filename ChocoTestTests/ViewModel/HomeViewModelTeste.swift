//
//  HomeViewModelTeste.swift
//  ChocoTestTests
//
//  Created by Maria Eugênia Pereira Teixeira on 25/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import XCTest
@testable import ChocoTest

class HomeViewModelTeste: XCTestCase {
    
    let sut = HomeViewModel()

    override func setUp() {
        sut.numberOfRows = 2
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_loading() {
        let delegate = Presenter()
        sut.delegate = delegate
        sut.viewModelDidLoad()
        XCTAssertTrue(delegate.loading)
        
        let businessLogicDelegate = HomeBusinessLogicMock()
        sut.productDelegate = businessLogicDelegate
        sut.productDelegate?.presentList()
        sut.delegate?.setLoading(isLoading: !businessLogicDelegate.showList)
        XCTAssertFalse(delegate.loading)
    }
    
    func test_order() {
        let businessLogicDelegate = HomeBusinessLogicMock()
        sut.productDelegate = businessLogicDelegate
        sut.productDelegate?.didOrder()
        XCTAssertTrue(businessLogicDelegate.ordered)
    }

    func test_error() {
        let delegate = Presenter()
        sut.delegate = delegate
        sut.delegate?.presentError(message: "ERROR")
        XCTAssertEqual(delegate.error, "ERROR")
    }

}
