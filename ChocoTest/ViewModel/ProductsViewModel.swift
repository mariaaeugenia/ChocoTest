//
//  ProductsViewModel.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 22/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation

protocol ProductsPresentable {
    func presentList()
    func presentError(message: String)
}

class ProductsViewModel {
    typealias T = Product
    var numberOfRows = 0
    
    var repo = ProductsRepository()
    var products = [Product]()
    var productsSelected = [Product]()
    var delegate: ProductsPresentable?
    
    init() {}
    
    func getProducts() {
        repo.request { [weak self] (result) in
            switch result {
            case .success(let list):
                self?.products = list
                self?.delegate?.presentList()
            case .failure(let error):
                self?.delegate?.presentError(message: error)
            }
        }
    }
    
    func cellForIndex(index: Int) -> Product {
        return products[index]
    }
    
    func didSelectedItem(index: Int) {
        let prod = products[index]
        productsSelected.append(prod)
    }
    
}
