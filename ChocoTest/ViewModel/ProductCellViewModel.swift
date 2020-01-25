//
//  ProductCellViewModel.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 23/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation


class ProductCellViewModel: ViewModel {
    
    var photo: String?
    var name: String?
    var price: Double?
    var isCheked = false
    
    required init() {}
    
    init(photo: String?, name: String?, price: Double?, isCheked: Bool) {
        self.photo = photo
        self.name = name
        self.price = price
        self.isCheked = isCheked
    }
    
    func getPhoto() -> String {
        if let photo = self.photo {
            return photo
        }
        return ""
    }
    
    func getName() -> String {
        if let name = self.name {
            return name
        }
        return ""
    }
    
    func priceCurreny() -> String {
        if let price = self.price {
            return price.getCurrency()
        }
        return "\(price ?? 0.0)"
    }
    
}
