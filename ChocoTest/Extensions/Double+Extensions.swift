//
//  Double+Extensions.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 23/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation


extension Double {
    
    func getCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "de_DE")
        formatter.numberStyle = .currency
        if let str = formatter.string(from: NSNumber(value: self)) {
            return str
        }
        return "\(self)"
    }
}
