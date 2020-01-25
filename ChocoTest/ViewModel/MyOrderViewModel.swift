//
//  MyOrderViewModel.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 24/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation


class MyOrderViewModel: ViewModel {
    
    var numberOfRows = 0
    
    var repo = OrderRepository()
    var products = [ProductObject]()
    var priceTotal: Double = 0.0
    
    required init() {}
    
    func setOrderFor(_ order: OrderObject) {
        let productsResult = order.products.map{$0}
        var prodObjects = [ProductObject]()
        prodObjects.append(contentsOf: productsResult)
        products = prodObjects
        numberOfRows = products.count
        priceTotal = order.priceTotal
    }
    
    func cellForIndex(index: Int) -> ProductCellViewModel {
        let product = products[index]
        let vm = ProductCellViewModel(photo: product.picture, name: product.name, price: product.price, isCheked: false)
        return vm
    }
    
    func didTapDetailButton(index: Int) -> String {
        let prod = products[index]
        return prod.productDescription
    }
    
    func getPriceTotal() -> String {
        return priceTotal.getCurrency()
    }

}
