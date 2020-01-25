//
//  URLSessionMock.swift
//  ChocoTestTests
//
//  Created by Maria Eugênia Pereira Teixeira on 25/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation
@testable import ChocoTest

class URLSessionMock: URLSession {
    private let url: URL
    private let data: Data
    private let statusCode: Int

    init(data: Data, statusCode: Int, url: URL = URL(string: "https://glc4swy1fd.execute-api.eu-west-1.amazonaws.com/choco")!) {
        self.data = data
        self.url = url
        self.statusCode = statusCode
    }

    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return MockURLSessionDataTask(url: url, data: data, statusCode: statusCode, completion: completionHandler)
    }
}
