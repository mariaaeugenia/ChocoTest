//
//  RouterMock.swift
//  ChocoTestTests
//
//  Created by Maria Eugênia Pereira Teixeira on 25/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation
@testable import ChocoTest

struct Body: Codable {
    let body: String?
}

class RouterMock<E: Endpoint>: NetworkRouter {
    
    private var task: URLSessionTask?
    
    func route(_ endpoint: E, completion: @escaping NetworkRouterCompletion) {

        let body = Body(body: "12345")
        
        do {
            let jsonData = try JSONEncoder().encode(body)
            let request = try self.buildRoute(from: endpoint)
            let mockSession = URLSessionMock(data: jsonData, statusCode: 200)
            task = mockSession.dataTask(with: request, completionHandler: completion)
        } catch {
            completion(nil, nil, error)
        }
        self.task?.resume()
    }
    
    func cancel() {
        self.task?.cancel()
    }
    
    private func buildRoute(from endpoint: E) throws -> URLRequest {
        var request = URLRequest(url: endpoint.baseURL.appendingPathComponent(endpoint.path), cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = endpoint.method.rawValue
        do {
            switch endpoint.task {
            case .requestWith(let parameters):
                try self.configureParameters(parameters: parameters, request: &request)
            case .requestWithURL(let url):
                try self.configureUrl(url: url, request: &request)
            }
            return request
        } catch {
            throw error
        }
    }
    
    private func configureParameters(parameters: Parameters?, request: inout URLRequest) throws {
        do {
            if let params = parameters {
                try JSONParameterEncoder.encode(urlRequest: &request, with: params)
            }
        } catch {
            throw error
        }
    }
    
    private func configureUrl(url: Parameters?, request: inout URLRequest) throws {
        do {
            if let params = url {
                try URLParameterEncoder.encode(urlRequest: &request, with: params)
            }
        } catch {
            throw error
        }
    }
    
    struct BodyParser: Decodable {
        let body: String

        init() {
            body = ""
        }
    }
    
}
