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
    var numberOfRows = 0
    
    var repo = ProductsRepository()
    var products = [Product]()
    var productsSelected = [Product]()
    var delegate: ProductsPresentable?
    
    init() {}
    
    func viewModelDidLoad() {
        getProducts()
    }
    
    private func getProducts() {
        repo.request { [weak self] (result) in
            switch result {
            case .success(let list):
                self?.products.append(contentsOf: list)
                self?.numberOfRows = list.count
                self?.delegate?.presentList()
            case .failure(let error):
                self?.delegate?.presentError(message: error)
            }
        }
    }
    
    func cellForIndex(index: Int) -> ProductCellViewModel {
        let product = products[index]
        let vm = ProductCellViewModel(photo: product.picture, name: product.name, price: product.price, shouldHideButton: false)
        return vm
    }
    
    func didSelectedItem(index: Int) {
        let prod = products[index]
        productsSelected.append(prod)
    }
    
}
