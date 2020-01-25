//
//  Order.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 22/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation
import RealmSwift

class OrderObject: Object {
    @objc dynamic var id = ""
    @objc dynamic var priceTotal: Double = 0.0
    @objc dynamic var created = Date()
    let products = List<ProductObject>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
