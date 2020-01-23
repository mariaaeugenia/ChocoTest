//
//  RealmRepository.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 22/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation
import RealmSwift

protocol RealmRepository {
    associatedtype T : Object
    func requestObject(completion: @escaping (Results<T>) -> Void)
    func saveObject(object: T, completion: @escaping ((Bool) -> Void))
}
