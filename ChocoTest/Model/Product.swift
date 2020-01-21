//
//  Product.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 20/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation

struct Product: Decodable {
    let guid: String?
    let name: String?
    let price: Double?
    let picture: String?
    let description: String?
}
