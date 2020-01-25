//
//  ApiTest.swift
//  ChocoTestTests
//
//  Created by Maria Eugênia Pereira Teixeira on 25/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import XCTest
@testable import ChocoTest

class ApiTest: XCTestCase {
    
    let mockApi = MockApi.mockGet
    let mockApiPost = MockApi.mockPost(param: "POST")

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_api_endpoint() {
        
        XCTAssertEqual(mockApi.baseURL, URL(string: "https://glc4swy1fd.execute-api.eu-west-1.amazonaws.com/choco"))
        XCTAssertEqual(mockApi.path, "/get/path")
        XCTAssertEqual(mockApi.method, HTTPMethod.get)
        
        
        XCTAssertEqual(mockApiPost.baseURL, URL(string: "https://glc4swy1fd.execute-api.eu-west-1.amazonaws.com/choco"))
        XCTAssertEqual(mockApiPost.path, "/post/path")
        XCTAssertEqual(mockApiPost.method, HTTPMethod.post)
        
    }
    

    func test_api_route_sucess() {
        let route = RouterMock<MockApi>()
        route.route(mockApi) { (data, response, error) in
            
            if let dataRrceived = data {
                do {
                    let decodable = try JSONDecoder().decode(Body.self, from: dataRrceived)
                    XCTAssertEqual(decodable.body, "12345")
                } catch {
                    
                }
            }
            
            if let response = response as? HTTPURLResponse {
                XCTAssertEqual(response.statusCode, 200)
            }
            
            XCTAssertNil(error)
            
        }
        
    }
    

}
