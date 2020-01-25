//
//  URLSessionDataTaskMock.swift
//  ChocoTestTests
//
//  Created by Maria Eugênia Pereira Teixeira on 25/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation
@testable import ChocoTest

class MockURLSessionDataTask: URLSessionDataTask {
    private let url: URL
    private let data: Data
    private let statusCode: Int
    private let completion: NetworkRouterCompletion

    init(url: URL, data: Data, statusCode: Int, completion: @escaping NetworkRouterCompletion) {
        self.data = data
        self.url = url
        self.completion = completion
        self.statusCode = statusCode
    }

    override func resume() {
        let response = HTTPURLResponse(url: url, statusCode: statusCode, httpVersion: nil, headerFields: nil)
        completion(data, response, nil)
    }
}
