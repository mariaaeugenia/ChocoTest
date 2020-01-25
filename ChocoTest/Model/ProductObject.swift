//
//  ProductObject.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 25/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation
import RealmSwift

class ProductObject: Object {
    @objc dynamic var guid = ""
    @objc dynamic var name = ""
    @objc dynamic var price: Double = 0.0
    @objc dynamic var picture = ""
    @objc dynamic var productDescription = ""
}
