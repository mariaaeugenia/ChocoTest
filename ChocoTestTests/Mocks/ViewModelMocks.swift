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

class PresenterLoading: Presentable {
    var loading = false
    func setLoading(isLoading: Bool) {
        loading = true
    }
    func presentError(message: String) {}
}
class PresenterNotLoadingNotError: Presentable {
    var loading = false
    var hasError = ""
    func setLoading(isLoading: Bool) {
        loading = false
    }
    func presentError(message: String) {
        hasError = ""
    }
}
class PresenterNotLoadingError: Presentable {
    var loading = false
    var hasError = ""
    func setLoading(isLoading: Bool) {
        loading = false
    }
    func presentError(message: String) {
        hasError = "Error"
    }
}


//MARK: - BUSINESS LOGIC MOCKS
//HOME
class LoginBusinessLogicMock: ProductsBusinessLogic {
    func presentList() {
        <#code#>
    }
    
    func presentPreOrder(itemsCount: Int, total: String) {
        <#code#>
    }
    
    func didOrder() {
        <#code#>
    }
    
    
}
