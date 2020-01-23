//
//  ProductCellViewModel.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 23/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation


class ProductCellViewModel {
    
    var photo = ""
    var name = ""
    var price: Double = 0.0
    var shouldHideButton = false
    
    init(photo: String, name: String, price: Double, shouldHideButton: Bool) {
        self.photo = photo
        self.name = name
        self.price = price
        self.shouldHideButton = shouldHideButton
    }
    
    func priceCurreny() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "de_DE")
        formatter.numberStyle = .currency
        if let str = formatter.string(from: NSNumber(value: price)) {
            return str
        }
        return "\(price)"
    }
    
}
