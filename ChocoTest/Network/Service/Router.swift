//
//  Router.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 20/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation

class Router<E: Endpoint>: NetworkRouter {
    
    private var task: URLSessionTask?
    
    func route(_ endpoint: E, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        do {
            let request = try self.buildRoute(from: endpoint)
            NetworkLogger.log(request: request)
            task = session.dataTask(with: request, completionHandler: { (data, response, error) in
                NetworkLogger.log(response: response, data: data)
                completion(data, response, error)
            })
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
        request.httpMethod = endpoint.method.rawValue
        do {
            switch endpoint.task {
            case .requestWith(let parameters):
                try self.configureParameters(parameters: parameters, request: &request)
            default:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
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
    
}
