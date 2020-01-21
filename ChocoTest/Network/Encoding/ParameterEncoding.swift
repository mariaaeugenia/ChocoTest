//
//  ParameterEncoding.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 20/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation

public typealias Parameters = [String:Any]

public protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}
