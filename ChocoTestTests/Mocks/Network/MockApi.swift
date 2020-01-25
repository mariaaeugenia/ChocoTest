//
//  MockEndpoint.swift
//  ChocoTestTests
//
//  Created by Maria Eugênia Pereira Teixeira on 25/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation
@testable import ChocoTest

public enum MockApi {
    case mockGet
    case mockPost(param: String)
}

extension MockApi: Endpoint {
    
    public var baseURL: URL {
        guard let url = URL(string: "https://glc4swy1fd.execute-api.eu-west-1.amazonaws.com/choco") else {
            fatalError(NetworkError.badUrl.rawValue)
        }
        return url
    }
    
    public var path: String {
        switch self {
        case .mockGet:
            return "/get/path"
        case .mockPost(_):
            return "/post/path"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .mockGet:
            return .get
        case .mockPost(_):
            return .post
        }
    }
    
    public var task: HTTPTask {
        switch self {
        case .mockGet:
            return .requestWithURL(url: ["url":"param"])
        case .mockPost(let bodyParam):
            return .requestWith(parameters: ["body":bodyParam])
        }
    }
}
