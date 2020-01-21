//
//  ApiManager.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 20/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation

class ApiManager {
    
    private let router = Router<Api>()
    
    func manager<T>(api: Api, completion: @escaping (Result<T>) -> Void) where T : Decodable {
        
        router.route(api) { data, response, error in
            
            if error != nil {
                completion(.failure(NetworkError.other.rawValue))
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(.failure(NetworkError.emptyData.rawValue))
                        return
                    }
                    do {
                        let decodable = try JSONDecoder().decode(T.self, from: responseData)
                        completion(.success(decodable))
                    } catch {
                        completion(.failure(NetworkError.parserError.rawValue))
                    }
                case .failure(let networkFailureError):
                    completion(.failure(networkFailureError))
                }
            }
        }
        
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299:
            return .success("")
        case 401...500:
            return .failure(NetworkError.authenticationError.rawValue)
        case 501...599:
            return .failure(NetworkError.internalServerError.rawValue)
        default:
            return .failure(NetworkError.other.rawValue)
        }
    }
}
