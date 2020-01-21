//
//  Repository.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 19/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation

typealias ResultCompletion<T> = (Result<T>) -> Void

protocol Repository {
    associatedtype T
    func request(completion: @escaping ResultCompletion<T>)
}
