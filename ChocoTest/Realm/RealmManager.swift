//
//  RealmManager.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 22/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {
    
    let realm = try! Realm()
    
    func saveObject<T>(object: T, completion: @escaping ((Bool) -> Void)) where T : Object {
        do {
            try realm.write() {
                realm.add(object)
                completion(true)
            }
        } catch {
            completion(false)
        }
    }
    
    func getObject<T>(completion: @escaping ((Results<T>) -> Void)) where T : Object {
        let objects: Results<T> = { realm.objects(T.self) }()
        completion(objects)
    }
}
