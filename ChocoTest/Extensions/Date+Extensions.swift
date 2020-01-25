//
//  Date+Extensions.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 24/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation


extension Date {
    
    func formateDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "de_DE")
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        let str = dateFormatter.string(from: self)
        return str
    }
}
