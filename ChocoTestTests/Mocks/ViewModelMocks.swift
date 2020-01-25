//
//  ViewModelMocks.swift
//  ChocoTestTests
//
//  Created by Maria Eugênia Pereira Teixeira on 25/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation
@testable import ChocoTest

//MARK: - PRESENTABLE MOCKS

class Presenter: Presentable {
    var loading = false
    var error = ""
    func setLoading(isLoading: Bool) {
        loading = isLoading
    }
    func presentError(message: String) {
        error = message
    }
}


//MARK: - BUSINESS LOGIC MOCKS
//HOME
class HomeBusinessLogicMock: ProductsBusinessLogic {
    var showList = false
    var itemsCount = 0
    var total = ""
    var ordered = false
    
    func presentList() {
        showList = true
    }
    
    func presentPreOrder(itemsCount: Int, total: String) {
        self.itemsCount = itemsCount
        self.total = total
    }
    
    func didOrder() {
        ordered = true
    }
    
    
}
