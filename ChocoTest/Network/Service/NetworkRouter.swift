//
//  NetworkRouter.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 20/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

protocol NetworkRouter: class {
    
    associatedtype E: Endpoint
    func route(_ route: E, completion: @escaping NetworkRouterCompletion)
    func cancel()
}
