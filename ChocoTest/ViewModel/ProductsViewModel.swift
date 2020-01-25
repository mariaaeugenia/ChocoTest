//
//  ProductsViewModel.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 22/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation

protocol ProductsBusinessLogic {
    func presentList()
    func presentPreOrder(itemsCount: Int, total: String)
}

class ProductsViewModel: ViewModel {
    var numberOfRows = 0
    
    var repo = ProductsRepository()
    var products = [Product]()
    var productsSelected = [Product]()
    var delegate: Presentable?
    var productDelegate: ProductsBusinessLogic?
    
    required init() {}
    
    func viewModelDidLoad() {
        delegate?.setLoading(isLoading: true)
        getProducts()
    }
    
    private func getProducts() {
        repo.request { [weak self] (result) in
            switch result {
            case .success(let list):
                self?.products.append(contentsOf: list)
                self?.numberOfRows = list.count
                self?.productDelegate?.presentList()
            case .failure(let error):
                self?.delegate?.presentError(message: error)
            }
            self?.delegate?.setLoading(isLoading: false)
        }
    }
    
    func cellForIndex(index: Int) -> ProductCellViewModel {
        let product = products[index]
        let vm = ProductCellViewModel(photo: product.picture, name: product.name, price: product.price, shouldHideButton: false)
        return vm
    }
    
    func didSelectItem(index: Int) {
        let prod = products[index]
        productsSelected.append(prod)
        productDelegate?.presentPreOrder(itemsCount: productsSelected.count, total: getTotal())
    }
    
    func didDeselectItem(index: Int) {
        let prod = products[index]
        if let prodIndex = productsSelected.firstIndex(where: { $0.guid == prod.guid }) {
            productsSelected.remove(at: prodIndex)
            productDelegate?.presentPreOrder(itemsCount: productsSelected.count, total: getTotal())
        }
    }

    private func getTotal() -> String {
        var total = 0.0
        for prod in productsSelected {
            total = total + (prod.price ?? 0.0)
        }
        return total.getCurrency()
    }
    
}
