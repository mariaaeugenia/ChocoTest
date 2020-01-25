//
//  ViewModel.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 24/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation

protocol ViewModel: class {
    init()
}

protocol Presentable: class {
    func setLoading(isLoading: Bool)
    func presentError(message: String)
}
