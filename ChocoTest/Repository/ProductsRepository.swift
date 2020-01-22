//
//  ProductsRepository.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 21/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation


struct ProductsRepository: Repository {
    
    typealias T = Products
    let request = ApiManager.init()
    
    func request(completion: @escaping (Result<Products>) -> Void) {
        request.manager(api: .products(token: "5e8c3c48-af49-425b-a6d9-f37f3511e4fa"), completion: completion)
    }
    
}
