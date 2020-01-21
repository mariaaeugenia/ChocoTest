//
//  Constants.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 19/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation

struct Constants {
    
    struct URLs {
        static var base: String {
            get {
                guard let stringURL = Bundle.main.infoDictionary?["BASE_URL"] as? String else {
                    fatalError("Set your BASE_URL on info.plist")
                }
                return stringURL
            }
        }
    }
}
