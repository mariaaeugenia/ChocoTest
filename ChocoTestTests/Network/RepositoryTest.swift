//
//  RepositoryTest.swift
//  ChocoTestTests
//
//  Created by Maria Eugênia Pereira Teixeira on 25/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import XCTest
@testable import ChocoTest

class RepositoryTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_login_repository() {
        let login = Login(email: "user@choco.com", password: "chocorian")
        let repo = LoginRepositoryMock(login: login)
        repo.request { (result) in
            switch result {
            case .success(let token):
                XCTAssertEqual(token.token, "5e8c3c48-af49-425b-a6d9-f37f3511e4fa")
            default:
                XCTFail()
            }
        }
    }
    
    func test_products_repository() {
        
        let repo = ProductsRepositoryMock()
        repo.request { (result) in
            switch result {
            case .success(let list):
                XCTAssertEqual(list.count, 2)
            default:
                XCTFail()
            }
        }
    }

}
