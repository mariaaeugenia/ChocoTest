//
//  ProductRepositoryMock.swift
//  ChocoTestTests
//
//  Created by Maria Eugênia Pereira Teixeira on 25/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation
@testable import ChocoTest

struct ProductsRepositoryMock: Repository {
    
    typealias T = Products
    
    func request(completion: @escaping (Result<Products>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
            let filePath = "Products"
            JSONDataFileLoader.loadJsonDataFromFile(filePath, completion: { data in
                if let json = data {
                    do {
                        let decoded = try JSONDecoder().decode(Products.self, from: json)
                        completion(.success(decoded))
                    }
                    catch _ as NSError {
                        completion(.failure("ERROR"))
                    }
                }
            })
        }
    }
    
}
