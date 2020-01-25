//
//  NetworkTest.swift
//  ChocoTestTests
//
//  Created by Maria Eugênia Pereira Teixeira on 25/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import XCTest
@testable import ChocoTest

class NetworkTest: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_url_encoding() {
        guard let url = URL(string: "https://glc4swy1fd.execute-api.eu-west-1.amazonaws.com/choco/products") else {
            XCTAssertTrue(false, "Could not instantiate url")
            return
        }
        var urlRequest = URLRequest(url: url)
        let parameters: Parameters = ["token": "12345"]
        
        do {
            try URLParameterEncoder.encode(urlRequest: &urlRequest, with: parameters)
            guard let fullURL = urlRequest.url else {
                XCTAssertTrue(false, "urlRequest url is nil.")
                return
            }
            
            let expectedURL = "https://glc4swy1fd.execute-api.eu-west-1.amazonaws.com/choco/products?token=12345"
            XCTAssertEqual(fullURL.absoluteString.sorted(), expectedURL.sorted())
        } catch {}
    }
    
    func test_json_encoding() {
        guard let url = URL(string: "https://glc4swy1fd.execute-api.eu-west-1.amazonaws.com/choco/login") else {
            XCTAssertTrue(false, "Could not instantiate url")
            return
        }
        var urlRequest = URLRequest(url: url)
        let parameters: Parameters = [
            "email": "ser@choco.com",
            "password": "chocorian"
        ]
        
        do {
            try JSONParameterEncoder.encode(urlRequest: &urlRequest, with: parameters)
            guard let _ = urlRequest.httpBody else {
                XCTAssertTrue(false, "Data is nil.")
                return
            }
            XCTAssert(true)
        } catch {}
        
    }
    
}
