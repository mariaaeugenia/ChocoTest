//
//  OrderRepository.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 22/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation
import RealmSwift

struct OrderRepository: RealmRepository {
    
    typealias T = Order
    let manager = RealmManager.init()
    
    func requestObject(completion: @escaping (Results<Order>) -> Void) {
        manager.getObject(completion: completion)
    }
    
    func saveObject(object: Order, completion: @escaping ((Bool) -> Void)) {
        manager.saveObject(object: object, completion: completion)
    }
    
}
