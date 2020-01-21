//
//  Api.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 19/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation

public enum Api {
    case login(username: String, password: String)
    case products(token: String)
}

extension Api: Endpoint {
    
    var baseURL: URL {
        guard let url = URL(string: Constants.URLs.base) else {
            fatalError(NetworkError.badUrl.rawValue)
        }
        return url
    }
    
    var path: String {
        switch self {
        case .login(_, _):
            return "login"
        case.products(let token):
            return "products?token=\(token)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login(_, _):
            return .post
        default:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .login(let username,let password):
            return .requestWith(parameters: ["email": username, "password": password])
        default:
            return .request
        }
    }
}
