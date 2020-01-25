//
//  OrdersViewModel.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 24/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation

class OrdersViewModel: ViewModel {
    
    var numberOfRows = 0
    
    var repo = OrderRepository()
    var orders = [Order]()
    var ordersSelected = [Order]()
    var orderDelegate: PresentableList?
    
    required init() {}
    
    func viewModelDidLoad() {
        getOrders()
    }
    
    private func getOrders() {
        repo.requestObject { [weak self] (result) in
            
            let list = result.map{$0}
            self?.orders.append(contentsOf: list)
            self?.numberOfRows = list.count
            self?.orderDelegate?.presentList()
        }
    }
    
    func cellForIndex(index: Int) -> (String, String) {
        let order = orders[index]
        let date = order.created.formateDate()
        let value = order.priceTotal.getCurrency()
        return (date, value)
    }
    
    func didSelectOrder(index: Int) -> Order {
        let order = orders[index]
        return order
    }
}
