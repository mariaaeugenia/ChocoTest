//
//  Product.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 20/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation
import RealmSwift

typealias Products = [Product]

struct Product: Decodable {
    let guid: String?
    let name: String?
    let price: Double?
    let picture: String?
    let description: String?
}

class ProductObject: Object {
    @objc dynamic var guid = ""
    @objc dynamic var name = ""
    @objc dynamic var price: Double = 0.0
    @objc dynamic var picture = ""
    @objc dynamic var productDescription = ""
}
